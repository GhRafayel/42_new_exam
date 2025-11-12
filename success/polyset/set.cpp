#include "set.hpp"

set::~set() {}

set::set(searchable_bag & obj) : bag(obj) {}


bool set::has(int val) const {
	return bag.has(val);
}

void set::insert (int val) {
	if (!bag.has(val))
		bag.insert(val);
}

void set::insert (int * arr, int size) {
	for (int i = 0; i < size; i++)
		insert(arr[i]);
}

void set::print() const {
	bag.print();
}

void set::clear() {
	bag.clear();
}

searchable_bag & set::get_bag() {
	return this->bag;
}
