Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C01F3DFC6D
	for <spacemit@lists.linux.dev>; Sun,  4 Oct 2026 21:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.128.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791149500; cv=none; b=Ygx6pEHpzSYqt2mbyBBVG2zU7jMaGmgi/x3zcaHdvQ7MY4LvQvCAQ8paHA0TNcEQ6RrCdIVFU/t05FAJbcVvgrQEjjyfglQsu7k8b28T3RvLGCLqehCMiG9aFuc8IuVnDy7QPUmEGkk9jRahidjAa3OHJ7JyqM7T7tI+eIUE7Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791149500; c=relaxed/simple;
	bh=0uhXhaA2VcVGYAPUYaiLQL9LL2uOQvVU3h6FVvKVpZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mGkmmcBwr5GJyL98E+De5eOioHGtPVG6MrWgH2W+6ES9hl0jp8oET4oDjyuPLXmUo/ZMVqe55lhqtkTW/MXEStQiYt4ok2z55czPiTr8F94AC69jipheAFSUVYzDowDH/Wb4Fn1m6ymVyD4ycKj8I78r8QPWh64ghNW4z2i0uqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de; spf=pass smtp.mailfrom=freeshell.de; dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b=ZKsaRWB2; arc=none smtp.client-ip=116.202.128.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b="ZKsaRWB2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1791148966;
	bh=/OUHZFnIbV9AReA94bQ08fxAoIzWGAOEjs0GbrA4Vo4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZKsaRWB2Y+Ej5oPOJNTY5vcks1khVooolSRqlHoqit3WApGzx6pa2C4Z+mXKl53Vm
	 /UKhYULEQM+BFDV0IHBUwSyHLnLYCgs3N/yCjyVxX7LLjacicjXPcdRRyCMUvVrD35
	 UJETwum44MOpGcpczMRT6HGg7BVRtjcE1qNHa7Tu19NkchrroiFUam65W48kQk3zhe
	 uo55uy891z657/mOL/xDj7Sl8Wne+bc2NcsNUHC4SItFx0K455eezOrTFserlm2J45
	 d85s/3B5wTl4q/RtWqSiOD4YM4EXvGACGkRd8f9wMwTvH4RlkOAPSWoO89gbiW9ZHJ
	 gQIqs7rpoNAYw==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id B1008B220271;
	Sun,  4 Oct 2026 23:22:44 +0200 (CEST)
Message-ID: <95e17452-4f40-4e1e-96b5-3c83f4389005@freeshell.de>
Date: Sun, 4 Oct 2026 14:22:37 -0700
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] doc: board: spacemit: document the SpacemiT boot
 image format
To: Junhui Liu <junhui.liu@pigmoral.tech>, u-boot@lists.u-boot-project.org
Cc: Tom Rini <trini@konsulko.com>, Quentin Schulz <quentin.schulz@cherry.de>,
 Simon Glass <sjg@chromium.org>, Daniel Golle <daniel@makrotopia.org>,
 Randolph Sapp <rs@ti.com>, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Kory Maincent <kory.maincent@bootlin.com>, Yixun Lan <dlan@kernel.org>,
 spacemit@lists.linux.dev
References: <20260909-spacemit-aihd-v2-0-780e98cf2fec@pigmoral.tech>
 <20260909-spacemit-aihd-v2-2-780e98cf2fec@pigmoral.tech>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20260909-spacemit-aihd-v2-2-780e98cf2fec@pigmoral.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Junhui,

On 9/9/26 08:51, Junhui Liu wrote:
> Document the boot image layout shared by the SpacemiT K1 and K3
> BootROMs, including the metadata headers and authentication areas.
> 
> Describe the K3 non-secure CRC32 path supported by mkimage and provide
> an example using the "smtimage" image type with "-n k3".
> 
> Tested-by: E Shattow <e@freeshell.de>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  doc/board/spacemit/index.rst    |   2 +-
>  doc/board/spacemit/smtimage.rst | 143 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 144 insertions(+), 1 deletion(-)
> 
> diff --git a/doc/board/spacemit/index.rst b/doc/board/spacemit/index.rst
> index a5e35ee12ab6..5797ada37d15 100644
> --- a/doc/board/spacemit/index.rst
> +++ b/doc/board/spacemit/index.rst
> @@ -7,4 +7,4 @@ SpacemiT
>  
>     bananapi-f3
>     k1-spl
> -
> +   smtimage
> diff --git a/doc/board/spacemit/smtimage.rst b/doc/board/spacemit/smtimage.rst
> new file mode 100644
> index 000000000000..edcc3091e8e7
> --- /dev/null
> +++ b/doc/board/spacemit/smtimage.rst
> @@ -0,0 +1,143 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +SpacemiT boot image format
> +=========================
> +
> +The SpacemiT K1 and K3 BootROMs load a SpacemiT boot image as the first-stage
> +bootloader (FSBL), either from persistent storage or over USB in MaskROM mode.

Introduce the topic of SpacemiT boot image format without the unrelated
boot flow. If the BootROM of both K1 and K3 are identical then use "K1
and K3", else if they are distinct and being described sharing the same
data structure format as input then use "K1 or K3".

Try instead, "BootROM on SpacemiT K1 or K3 System-on-Chip expects the
First Stage BootLoader to be wrapped in a specially constructed image
layout."

> +
> +Image layout
> +------------
> +
> +K1 and K3 share the same layout. A fixed 4 KiB prefix contains two 32-byte

Drop the redundant sentence "K1 and K3 share the same layout", as it is
implied above and cannot be anything else by the later description.

> +metadata headers, key slots, and signature slots. The aligned SPL payload and

The reasoning of alignment should be written if it is known, by changing
"The aligned SPL payload" to e.g. "The word-aligned SPL payload" or "The
half-word aligned SPL payload" or "The nibble-aligned SPL payload" etc.
whatever that is actually, or disregard my suggestion here if it is not
known the reason for this.

> +a trailing authentication area follow::
> +
> +    offset                                    size
> +    0x000  +-------------------------------+
> +           | root RSA-2048 modulus         |  0x100
> +    0x100  +-------------------------------+
> +           | header0                       |  0x020
> +    0x120  +-------------------------------+
> +           | key-selection metadata        |  0x1e0
> +    0x300  +-------------------------------+
> +           | OEM public-key slots          |  0x800
> +    0xb00  +-------------------------------+
> +           | signature0                    |  0x100
> +    0xc00  +-------------------------------+
> +           | reserved                      |  0x3e0
> +    0xfe0  +-------------------------------+
> +           | header1                       |  0x020
> +    0x1000 +-------------------------------+
> +           | SPL payload (32-byte aligned) |

Keep as-is when discussing byte-layout to describe alignment as "n-byte"
and not word or half-word or nibble etc. when considering my previous
suggestion, FYI.

> +           +-------------------------------+
> +           | signature1                    |  0x100
> +           +-------------------------------+
> +
> +For payload size ``P`` and ``A = ALIGN(P, 32)``, the image size is
> +``0x1000 + A + 0x100``.
> +
> +Metadata header
> +---------------
> +
> +Both header0 and header1 use the following format:
> +
> +.. list-table::
> +   :header-rows: 1
> +
> +   * - Offset
> +     - Size
> +     - Field
> +     - Description
> +   * - 0x00
> +     - 4
> +     - ``magic``
> +     - ``AIHD``
> +   * - 0x04
> +     - 1
> +     - ``version``
> +     - Anti-rollback image version
> +   * - 0x05
> +     - 1
> +     - ``secure``
> +     - Zero selects anti-rollback bank 0
> +
> +       Non-zero selects anti-rollback bank 1
> +   * - 0x06
> +     - 2
> +     - ``reserved``
> +     - Reserved
> +   * - 0x08
> +     - 8
> +     - ``image_size``
> +     - header0: prefix information
> +
> +       header1: aligned payload size
> +   * - 0x10
> +     - 8
> +     - ``load_addr``
> +     - Unused by the common authentication code
> +   * - 0x18
> +     - 4
> +     - ``header_crc``
> +     - K3: CRC32 over header bytes ``[0x00, 0x18)``
> +   * - 0x1c
> +     - 4
> +     - ``image_crc``
> +     - K3: CRC32 over the payload in header1 only
> +
> +``header1.image_size`` records the aligned payload size and therefore
> +determines the location of signature1.
> +
> +Authentication
> +--------------
> +
> +K1 and K3 apply different authentication policies:
> +
> +.. list-table::
> +   :header-rows: 1

list-table format on this axis orientation is confusing to review
without first rendering the formatted output, and is a problem for
'diff' tool output in future changes. Please flip the axis i.e.:

Category 1
  SoC 1
  SoC 2
  SoC 3

Category 2
  SoC 1
  SoC 2
  SoC 3

Write instead this as:

SoC 1
  Category 1
  Category 2

SoC 2
  Category 1
  Category 2

SoC 3
  Category 1
  Category 2

> +
> +   * - Area
> +     - K1
> +     - K3 non-secure boot mode
> +     - K3 secure boot mode
> +   * - Root and OEM keys
> +     - RSA-2048 moduli with an eFuse root-hash check when secure boot is
> +       enabled
> +     - Unused
> +     - RSA-2048 moduli with an eFuse root-hash check
> +   * - Header CRC
> +     - Not checked separately
> +     - header1 verified
> +
> +       header0 ignored
> +     - Both verified and covered by RSA
> +   * - Image CRC
> +     - Not checked separately
> +     - Payload CRC32 in header1
> +     - Covered by RSA but not checked separately
> +   * - signature0
> +     - Verified with the root key over ``[0x100, 0xb00)``
> +     - Unused
> +     - Verified with the root key over ``[0x100, 0xb00)``
> +   * - signature1

Why the mixed-use of square brackets and parenthesis?

> +     - Verified with the SPL key over header1 and the aligned payload
> +     - Unused
> +     - Verified with the SPL key over header1 and the aligned payload
> +
> +K1 verifies both signatures even without a programmed root-key hash. In this
> +case, the root key comes from the image and is not authenticated by hardware,
> +so the image, keys, and signatures can be replaced together.
> +
> +K3 uses CRC32 in non-secure boot mode and hardware-rooted RSA in secure boot
> +mode.
> +
> +Creating an image
> +-----------------
> +
> +U-Boot currently creates only K3 images for non-secure boot mode. Package an
> +SPL payload with::
> +
> +    $ tools/mkimage -T smtimage -n k3 -d u-boot-spl.bin FSBL.bin

Use lowercase letters for the output filename if it is not any CONFIG_
symbol or preprocessor define symbol, and re-use an existing filename
stem as for example any of:

u-boot-spl.smtimage
u-boot-spl-mkimage.bin
u-boot-spl.bin.smtimage
spl.bin

A distro package of u-boot or later user of the build system may copy
this output to "FSBL.bin" but that is nothing to do with us here. In
fact for documentation purpose here it is useful to retain "FSBL.bin" as
a distinct description of the vendor firmware SPL and not get this
confused for mainline u-boot.

> +
> +K1 images and RSA-authenticated K3 images are not yet supported.
> 

This statement may be simply deleted. It is obvious that support does
not exist when it is not described here. If you would like to keep this
line it is not any problem. I think it is more unnecessary work for
later to update and remove it.

-E
