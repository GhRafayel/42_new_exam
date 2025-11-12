#include "searchable_tree_bag.hpp"

searchable_tree_bag::~searchable_tree_bag() {}

searchable_tree_bag::searchable_tree_bag() : tree_bag() {}

searchable_tree_bag::searchable_tree_bag(const searchable_tree_bag & obj) : tree_bag(obj) {}

searchable_tree_bag & searchable_tree_bag::operator = (const searchable_tree_bag & obj) {

	if (this == & obj) return *this;
	
	tree_bag::operator= (obj);
	return *this;
}

bool searchable_tree_bag::search(node *pnt, int val) const 
{
	if (pnt == nullptr) return false;
	if (pnt->value == val) return true;
	if (pnt->value < val)
		return (search(pnt->r, val));
	else
		return (search(pnt->l, val));
}

bool searchable_tree_bag::has(int val) const
{
	return (search(this->tree, val));
}
