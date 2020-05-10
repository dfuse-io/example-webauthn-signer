## Example WebAuthN Signer

This is a module showcasing how to signed an EOS transaction with WebAuthN.

EOSIO WebAuthN signing only accepts signing data from an `HTTPS` website. We use
[mkcert](https://github.com/FiloSottile/mkcert) to make that easy to work with.

    mkcert -install

Should register the `./localhost.pem` file as a valid SSL local certificate. If it's
not the case, you can re-generate everything with:

    mkcert localhost
    mkcert -install

### Workflow

Start with the following calls

    ./prepare.sh
    yarn generate

This install all the required dependencies as well as opening a Browser that
will generate a new valid EOSIO WebAuthN public key. The private key is kept
in the Browser paired with a unique identifier for when we will signing something.

Once you have the public key, it's written on disk, re-generating it overwrite
the current one.

To sign a transfer, use:

    yarn transfer

Which generates the required transaction data to sign, open a Browser
with a given URL containing information about the transaction to sign,
perform the signing of the transaction in the Browser and returns
all that to our local server that complete the transaction pushing
on our local node.

All configurations are hard-coded right now, edit the source to change
them.

Hopefully, all works out of the box, but nothing is less sure than
that!
