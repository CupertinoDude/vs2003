IF NOT EXIST Debugging\BUILDALL.BAT GOTO DEBUGGINGEND
  CD Debugging
  CALL BUILDALL.BAT %1
  CD ..
:DEBUGGINGEND

IF NOT EXIST Deployment\BUILDALL.BAT GOTO DEPLOYMENTEND
  CD Deployment
  CALL BUILDALL.BAT %1
  CD ..
:DEPLOYMENTEND

IF NOT EXIST PlatformIntroduction\BUILDALL.BAT GOTO PLATFORMINTRODUCTIONEND
  CD PlatformIntroduction
  CALL BUILDALL.BAT %1
  CD ..
:PLATFORMINTRODUCTIONEND

IF NOT EXIST ResourcesAndLocalization\BUILDALL.BAT GOTO RESOURCESANDLOCALIZATIONEND
  CD ResourcesAndLocalization
  CALL BUILDALL.BAT %1
  CD ..
:RESOURCESANDLOCALIZATIONEND
