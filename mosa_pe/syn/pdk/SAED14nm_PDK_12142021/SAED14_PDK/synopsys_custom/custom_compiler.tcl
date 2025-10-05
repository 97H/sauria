db::setAttr maximized -of [gi::getFrames 1] -value true
db::setAttr geometry -of [gi::getFrames 1] -value 1014x516+5+28
gi::addWindow [dm::openLibraryManager] -to 1
gi::setCurrentIndex {libs} -index {analogLib} -in [gi::getWindows 2]
gi::setItemSelection {libs} -index {analogLib} -in [gi::getWindows 2]
gi::sortItems {libs} -column {Libraries} -order {descending} -in [gi::getWindows 2]
gi::setCurrentIndex {libs} -index {SAED_PDK_14} -in [gi::getWindows 2]
gi::setItemSelection {libs} -index {SAED_PDK_14} -in [gi::getWindows 2]
exit
