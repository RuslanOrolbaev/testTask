
class Tree {
Tree({required this.treeHight, this.treeTrunkWidth=2});
  final String space = ' ';
  final String _leftSymbol = '/';
  final String _rightSymbol = '\\';
  final String _treeTrunkSymbol='|';
  final int treeHight;
  final int treeTrunkWidth;
  int _fatTreeModifier= 0;

  
  build (){
    _buildTreeCrown(treeHight);
    _buildTreeTrunk(treeHight);
  } 

  _buildTreeCrown(int hight){
    if(_trunkWiderThanCrown()){_fatTreeModifier =(treeTrunkWidth~/2)-treeHight;} else {_fatTreeModifier =0;}
for (int rowNumber=1; rowNumber<=hight; rowNumber++) {
_buildTreeCrownRow(rowNumber);
}
  }

  _buildTreeTrunk(int hight){
    int leftShift = treeHight-treeTrunkWidth~/2;
    String treeTrunkString = _numberToSpaces(leftShift) + _buildStringForTreeTrunk(treeTrunkWidth);
    print (treeTrunkString);
  }

  _buildTreeCrownRow(int rowNumber){
    int leftShift = treeHight - rowNumber +_fatTreeModifier;
    int rightShift = (rowNumber-1)*2;
    String rowString = _buildTreeCrownLeftSide(leftShift) + _buildTreeCrownRightSide(rightShift);
    print(rowString);
  }

  String _buildTreeCrownLeftSide(int leftShift) => _numberToSpaces(leftShift) + _leftSymbol;
    

  String _buildTreeCrownRightSide(int rigthShift) => _numberToSpaces(rigthShift)+_rightSymbol;

  String _buildStringForTreeTrunk(int treeTrunkWidth) {
    String stringForTreeTrunk = '';
    for (int i=0; i<treeTrunkWidth; i++){
      stringForTreeTrunk = stringForTreeTrunk + _treeTrunkSymbol;
    }
    return stringForTreeTrunk;
  }

String _numberToSpaces (int number){
String result='';
for (int i=0; i<number;i++) {
  result = result + space;
}
return result;
}

bool _trunkWiderThanCrown(){
if (treeTrunkWidth>treeHight*2)return true; else return false;
}


}


void main() {
const int treeHight = 5;
const int treeTrunkWidth = 4;
if (treeHight>=10|| treeHight<=2) {print('The tree hight should be between 2 and 10 due to test task limitations');} else {
Tree tree = Tree(treeHight: treeHight, treeTrunkWidth: treeTrunkWidth);
tree.build();
}
}

