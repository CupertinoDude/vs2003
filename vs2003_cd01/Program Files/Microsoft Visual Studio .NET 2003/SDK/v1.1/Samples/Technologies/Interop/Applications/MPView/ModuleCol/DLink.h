#ifndef DLINK_H
#define DLINK_H

#include <crtdbg.h>

struct Node
{
	Node * pPre;
	Node * pNext;
	void * ptPayLoad;
};

template<class T>
class CDLink
{
public:
	CDLink();
	~CDLink();

	bool IsEmpty()
	{
		return m_pHead == NULL;
	}
	void Insert(T * pT);
	void AddToHead(T * pT);
	void AddToTail(T * pT);
	void AddBefore(T * pBeforeThis, T * pT);
	void AddAfter(T * pAfterThis, T * pT);

	Node * Find(T * pT);
	bool HasThis(T * pT);
	void Remove(T * pT);
	void RemoveBefore(T * pT);
	void RemoveAfter(T * pT);
	void RemoveHead();
	void RemoveTail();

	int Count()
	{
		return m_nCount;
	}

	void CleanUp();
	void CleanUpHeapMemory();

	Node * Head()
	{
		return m_pHead;
	}

	Node * Tail()
	{
		return m_pTail;
	}

	T * First()
	{
		return (m_pHead) ? m_pHead->ptPayLoad : NULL;
	}

	T * Last()
	{
		return (m_pTail) ? m_pTail->ptPayLoad : NULL;
	}


private:
	Node * m_pHead;
	Node * m_pTail;
	int m_nCount;
};

template<class T>
CDLink<T>::CDLink()
{
	m_pHead = NULL;
	m_pTail = NULL;
	m_nCount = 0;

}

template<class T>
CDLink<T>::~CDLink()
{
	//When the Link list goes away, it will not release the memory associated with the PayLoad.
	//Release the memory is the responsibility of the client of this list
	CleanUp();
}

template<class T>
void CDLink<T>::Insert(T * pT)
{
	//This method will insert a NULL payload Node if pT == NULL 

	Node * pNode = new Node;
	_ASSERTE(pNode);
	if (pNode)
	{
		pNode->ptPayLoad = (void *) pT;
		
		if (m_pTail == NULL)
		{
			_ASSERTE(m_pHead == NULL);
			m_pHead = pNode;
			m_pTail = pNode;
			pNode->pNext = NULL;
			pNode->pPre = NULL;
			return;
		}
		
		_ASSERTE(m_pTail->pNext == NULL);
		m_pTail->pNext = pNode;
		pNode->pPre = m_pTail;
		pNode->pNext = NULL;
		m_pTail = pNode;

		m_nCount++;
	}

}

template<class T>
void CDLink<T>::AddToHead(T * pT)
{
	Node * pNode = new Node;
	_ASSERTE(pNode);
	if (pNode)
	{
		pNode->ptPayLoad = (void *)pT;
		if (m_pHead == NULL)
		{
			_ASSERTE(!m_pTail);
			m_pHead = pNode;
			m_pTail = pNode;
			pNode->pNext = NULL;
			pNode->pPre = NULL;
			return;
		}

		_ASSERTE(m_pTail->pNext == NULL);
		m_pHead->pPre = pNode;
		pNode->pNext = m_pHead;
		pNode->pPre = NULL;
		m_pHead = pNode;

		m_nCount++;
	}

}

template<class T>
void CDLink<T>::AddToTail(T * pT)
{
	Node * pNode = new Node;
	_ASSERTE(pNode);
	if (pNode)
	{
		pNode->ptPayLoad = (void *)pT;
		if (m_pHead == NULL)
		{
			_ASSERTE(!m_pTail);
			m_pHead = pNode;
			m_pTail = pNode;
			pNode->pNext = NULL;
			pNode->pPre = NULL;
			return;
		}

		_ASSERTE(m_pTail->pNext == NULL);
		m_pTail->pNext = pNode;
		pNode->pNext = NULL;
		pNode->pPre = m_pTail;
		m_pTail = pNode;

		m_nCount++;

	}
}

template<class T>
Node * CDLink<T>::Find(T * pT)
{
	if (m_pHead == NULL)
	{
		_ASSERTE(m_pTail == NULL);
		return NULL;
	}

	Node * pCur = m_pHead;
	while(pCur)
	{
		if ( pCur->ptPayLoad == (void *)pT )
			return pCur;

		pCur = pCur->pNext;
	}

	return NULL;
}

template<class T>
void CDLink<T>::AddBefore(T * pBeforeThis, T * pT)
{
	Node * pNode = Find(pBeforeThis);
	_ASSERTE(pNode && "Can't find the node");
	if (pNode)
	{
		if (pNode == m_pHead)
		{
			AddToHead(pT);
			return;
		}

		Node * pNew = new Node;
		_ASSERTE(pNew);
		if (pNew)
		{
			pNew->ptPayLoad = (void *)pT;
			pNew->pNext = pNode;
			pNew->pPre = pNode->pPre;
			pNode->pPre->pNext = pNew;
			pNode->pPre = pNew;

			m_nCount++;

		}
	}
}

template<class T>
void CDLink<T>::AddAfter(T * pAfterThis, T * pT)
{
	Node * pNode = Find(pAfterThis);
	_ASSERTE(pNode && "Can't find the node");

	if (pNode)
	{
		if (pNode == m_pTail)
		{
			AddToTail(pT);
			return;
		}

		Node * pNew = new Node;
		_ASSERTE(pNew);
		if (pNew)
		{
			pNew->ptPayLoad = (void *)pT;
			pNew->pPre = pNode;
			pNew->pNext = pNode->pNext;
			pNode->pNext->pPre = pNew;
			pNode->pNext = pNew;

			m_nCount++;

		}
	}
}

template<class T>
bool CDLink<T>::HasThis(T * pT)
{
	Node * pNode = m_pTail;
	while(pNode != NULL)
	{
		if ( pNode->ptPayLoad == (void *)pT )
		{
			return true;
		}
		pNode = pNode->pPre;
	}

	return false;
}

template<class T>
void CDLink<T>::Remove(T * pT)
{
	Node * pNode = Find(pT);
	if (pNode)
	{
		if (pNode == m_pHead)
		{
			RemoveHead();
			return;
		}

		if (pNode == m_pTail)
		{
			RemoveTail();
			return;
		}

		pNode->pPre->pNext = pNode->pNext;
		pNode->pNext->pPre = pNode->pPre;

		delete pNode;

		m_nCount--;

	}
}

template<class T>
void CDLink<T>::RemoveHead()
{
	if (m_pHead != NULL)
	{
		_ASSERTE(m_pTail);
		Node * pNode = m_pHead;
		m_pHead = m_pHead->pNext;
		if (m_pHead)
			m_pHead->pPre = NULL;
		else
			m_pTail = NULL;

		delete pNode;	

		m_nCount--;

	}
}

template<class T>
void CDLink<T>::RemoveTail()
{
	if (m_pTail != NULL)
	{
		_ASSERTE(m_pHead);
		_ASSERTE(m_pTail->pNext == NULL);
		Node * pNode = m_pTail;
		m_pTail = m_pTail->pPre;
		if (m_pTail)
			m_pTail->pNext = NULL;
		else
			m_pHead = NULL;
	
		delete pNode;

		m_nCount--;

	}
}

template<class T>
void CDLink<T>::RemoveBefore(T * pT)
{
	Node * pNode = Find(pT);
	if (pNode)
	{
		if (pNode->pPre == NULL)
		{
			_ASSERTE(pNode == m_pHead);
			return;
		}

		if (pNode->pPre == m_pHead)
		{
			RemoveHead();
			return;
		}

		Node * pFree = pNode->pPre;

		pNode->pPre->pPre->pNext = pNode;
		pNode->pPre = pNode->pPre->pPre;

		delete pFree;

		m_nCount--;

	}
}


template<class T>
void CDLink<T>::RemoveAfter(T * pT)
{
	Node * pNode = Find(pT);
	if (pNode)
	{
		if (pNode->pNext == NULL)
		{
			_ASSERTE(pNode == m_pTail);
			return;
		}

		if (pNode->pNext == m_pTail)
		{
			RemoveTail();
			return;
		}

		Node * pFree = pNode->pNext;
		pNode->pNext = pNode->pNext->pNext;
		pNode->pNext->pPre = pNode;

		delete pFree;

		m_nCount--;

	}
}


template<class T>
void CDLink<T>::CleanUp()
{
	Node * pNode = NULL;
	while(m_pHead != NULL)
	{
		pNode = m_pHead;
		m_pHead = m_pHead->pNext;
		delete pNode;
	}

	m_pHead = m_pTail = NULL;
	m_nCount = 0;

}

template<class T>
void CDLink<T>::CleanUpHeapMemory()
{
	Node * pNode = NULL;
	while(m_pHead != NULL)
	{
		pNode = m_pHead;
		m_pHead = m_pHead->pNext;
		delete [] (T *)(pNode->ptPayLoad);
		delete pNode;
	}

	m_pHead = m_pTail = NULL;
	m_nCount = 0;

}


#endif






