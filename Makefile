status=dev

build:
	python setup.py build_ext --inplace

clean:
	find . | grep -E "(__pycache__|\.pyc|\.o|\.so|\.pyo$$)" | xargs rm -rf
	rm -rf build

create-branch:
	git checkout -b CSA-$(num) dev
	git push --set-upstream origin CSA-$(num)

delete-branch:
	git push origin --delete CSA-$(num)
	git branch -d CSA-$(num)

force-delete:
	git push origin --delete CSA-$(num)
	git branch -D CSA-$(num)

pypi-upload:
	python setup.py sdist upload -r pypi

test-pypi-upload:
	python setup.py sdist upload -r pypitest

.PHONY: clean build create-branch delete-branch force-delete pypi-upload test-pypi-upload
