void main() {}

class MathQue {
  String que;
  String ans;

  MathQue({this.que, this.ans});

  List<MathQue> queList = [
    MathQue(que: '2+2', ans: '4'),
    MathQue(que: '2+4', ans: '6'),
    MathQue(que: '2+9', ans: '6'),
    MathQue(que: '2+10', ans: '11'),
    MathQue(que: '2+12', ans: '12'),
  ];
}
