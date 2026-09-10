Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1C748664F
	for <spacemit@lists.linux.dev>; Thu, 10 Sep 2026 12:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789043749; cv=pass; b=qElCgYMehDU7s9uAks+aypUNHRvZwvtUOca4cawDKnyQcqfQ7iUZW8cbWFp99+jrnPgL94320zik290rUmZTNfCP6npmygaffFsLaz86x19+k8mj/p+zJDuJ+H8mMn1yL2JkcJr0M6JclmJiA7DeDrTOClDyQyJIhhQpqCyJE68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789043749; c=relaxed/simple;
	bh=/nPQu+SOD24SE2noALG5/rbsRzKNGzugZSo3Ka5KVV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S3YwhW7+aw/EzyJVs39Ou14ggN0hbS0coU0ynso0im8iqUbVdO2NQXqvPARDUlpIpbesMnbO8EvcCS2PAm2aR9Ilf4EhRSh0eEOK++xvZKJZeJbz1yQLVYsGD8ohF19/mItOgP/HOc5Tw6POGSmAk0bwRcQRA3KJ5Pxi/hNGNec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b=J0bDtPw1; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b="J0bDtPw1"
ARC-Seal: i=1; a=rsa-sha256; t=1789043735; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lVTxH/vl79SKRIAOBf1IJSybT/VHQUS5aZpPg6n4j1IT81IIOV52VG9xnR7JzPDQsyh/FLCIKjquSXv6sAK2pok5FlVB8QEcBiw9gL8THGqJr9vQjIjNntHKqsu8Q+cHRZrzG6WTn/j21ciyC90m4OtxtwXIzxW1MbS1WoXxt+8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789043735; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rFxi++1uo2N2nKvOQrvgJ41PRPRxMHX+KzgtflsfrjQ=; 
	b=TyhmqXLu59mBCcBsN5vZdnxAOZIGGd077pojXZ4HmUHacvxwF7HEZ9TWHSnLKxhAvQD3IKUITB+jNQVKIXit41GMhZ2jxeGpOvb8MerEiygAj+QXdzPc15/rOLNx+PwFqu9AgooDAr25ZP+aFnseiWyF+xrRTvj9iIjWWlYVRpQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789043735;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=rFxi++1uo2N2nKvOQrvgJ41PRPRxMHX+KzgtflsfrjQ=;
	b=J0bDtPw1y+wb1k6k2Ns+juSYg+xuWYy0tE5QpPe+EO/26GqmotwF0op8a3+QJ4Vt
	w6APRK2qSue1W5euWDGmKA6JCd108OYk4B6pZrqHg2WxEomFJT+4Wm8rO6Z3BJDFGAv
	6TSY+9TUqBHW7KeGPwFNVgykLtT8Jp/kL3R8zYx0=
Received: by mx.zohomail.com with SMTPS id 178904373201642.900811622213496;
	Thu, 10 Sep 2026 05:35:32 -0700 (PDT)
Date: Thu, 10 Sep 2026 12:35:26 +0000
From: Yao Zi <me@ziyao.cc>
To: Junhui Liu <junhui.liu@pigmoral.tech>, u-boot@lists.u-boot-project.org
Cc: Tom Rini <trini@konsulko.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Simon Glass <sjg@chromium.org>,
	Daniel Golle <daniel@makrotopia.org>, Randolph Sapp <rs@ti.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Kory Maincent <kory.maincent@bootlin.com>,
	E Shattow <e@freeshell.de>, Yixun Lan <dlan@kernel.org>,
	spacemit@lists.linux.dev, Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH v2 1/2] tools: mkimage: add SpacemiT K3 boot image support
Message-ID: <aqKkDoGgnJkOQ8s-@pie>
References: <20260909-spacemit-aihd-v2-0-780e98cf2fec@pigmoral.tech>
 <20260909-spacemit-aihd-v2-1-780e98cf2fec@pigmoral.tech>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-spacemit-aihd-v2-1-780e98cf2fec@pigmoral.tech>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/289.29.40
X-ZohoMailClient: External

On Wed, Sep 09, 2026 at 11:51:08PM +0800, Junhui Liu wrote:
> The SpacemiT BootROM loads the FSBL from a boot image consisting of a
> fixed 4 KiB header with two metadata headers and authentication
> information, followed by a 32-byte-aligned SPL payload and a trailing
> authentication area. K1 and K3 share the same layout, but use different
> integrity and authentication schemes. K1 requires RSA-signed images,
> while K3 uses CRC32 to verify images in non-secure boot mode.
> 
> Add mkimage type "smtimage" for the K3 CRC32 path. Populate both
> metadata headers, fill their CRC32 values and the payload CRC32, and
> reserve the authentication areas required by the layout.
> 
> The image header has no reliable K1/K3 identifier, so select the SoC
> with -n. Omit dumpimage support since it cannot take -n to distinguish
> between the variants.
> 
> Only "-n k3" in non-secure boot mode is supported. Route SoC differences
> through a variant table so K1 and RSA authentication support can be
> added later.
> 
> Tested-by: E Shattow <e@freeshell.de>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  boot/image.c     |   1 +
>  include/image.h  |   1 +
>  tools/Makefile   |   1 +
>  tools/smtimage.c | 202 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 205 insertions(+)

...

> diff --git a/tools/smtimage.c b/tools/smtimage.c
> new file mode 100644
> index 000000000000..96e8b5d8d171
> --- /dev/null
> +++ b/tools/smtimage.c

...

> +#include <image.h>
> +#include <u-boot/crc.h>
> +#include "imagetool.h"

I think you should explicitly include all headers you used explicitly,
e.g., string.h for strcmp(), stdint.h for uintXX_t...

...

> +static const struct smtimage_variant *smtimage_get_variant(const char *name)
> +{
> +	int i;
> +
> +	if (!name || !*name)
> +		return NULL;

Isn't this !*name check unnecessary?

> +
> +	for (i = 0; i < ARRAY_SIZE(smtimage_variants); i++)
> +		if (!strcmp(name, smtimage_variants[i].name))
> +			return &smtimage_variants[i];
> +
> +	return NULL;
> +}

Regards,
Yao Zi
