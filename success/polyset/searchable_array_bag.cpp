#include "searchable_array_bag.hpp"

searchable_array_bag::~searchable_array_bag() {}

searchable_array_bag::searchable_array_bag() : array_bag() {}

searchable_array_bag::searchable_array_bag(const searchable_array_bag & obj) : array_bag(obj) {}

searchable_array_bag & searchable_array_bag::operator=(const searchable_array_bag & obj) {
	if (this == & obj) return *this;
	array_bag::operator = (obj);
	return *this;
}

bool searchable_array_bag::has(int val) const {
	for(int i = 0; i < this->size; i++)
	{
		if (this->data[i] == val) return true;
	}
	return false;
}
