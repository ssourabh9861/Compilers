#include <string>
#include <vector>

using namespace std;

class Node{
	private:
	string type;
	string val;

	
	public:
	int nodeNo;
	vector<Node *> child;
	Node(string tokenType, string tokenVal)
	{
		type = tokenType; 
		val = tokenVal;
	}
	~Node()
	{
	}

	string getNodeType()
	{
		return type;
	}

	string getNodeVal()
	{
		return val;
	}
	
	void addChild(Node * c)
	{
		child.push_back(c);
	}

};
