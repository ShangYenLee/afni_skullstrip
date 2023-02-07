import argparse
import nibabel as nib

parser = argparse.ArgumentParser()
parser.add_argument('--orig_dir',type=str,default='')
parser.add_argument('--sorce_dir',type=str,default='')
args = parser.parse_args()

try:
    affine = nib.load(args.orig_dir).affine
    sorce = nib.load(args.sorce_dir).get_fdata()
    nib.save(nib.Nifti1Image(sorce,affine),args.sorce_dir)
except:
    print(f'Processing {args.sorce_dir} error')
