Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=185.125.188.122
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794222648;
	b=Gv58R1LwfEM4Qtp6PE+ifUdqG+q3EpSJXXkEuvIQjPbGe5abjwNJexrrCOxxmY0FcWF8
	 G6vVKwjVtjvaUL3sfSR4XuwqKaPF0Xj+Q4XgDVTu0qUATbmCJ3vDevhnYvjZrZfe1Hz/o
	 FxeuCaeV4HUU9Md3up/KsybEyj1W9M6Rb5lKWSq4CKmtN30S6lNfQRulBVzisPzd8l0RL
	 P1SD006iQAInsx+OXegBmq0Rd/wVzEbeiTThPiRe5JTeuTa4tZYafF9uItGyDDg/788eu
	 gWwXBUsIitmLYNGSdd4EX/AAyXIXrn6KeL7qYY0lS97+5Q0RnklmLkH8SwG8Oe8MosA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794222648;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=llvqyMiXnc/47moE8culPRvGGeNKWMoMtXMZ7VTfmpM=;
	b=Vg5JVBk5A2rQvNIYAcl/b5Tgoruu3U/ro7nj2Bg0egfsgYdY3cNDIGVfeoHAUllxOF4o
	 Cbgr/rx1EJJhORsqrKxrOHy9ZkKY9J638M1H0gNkSEFLm4nzw0B0M2wy6pkP5IWsfHkTR
	 gC3IrFv5h6m1s1RGTcpRCURYPGeI+JJoguQ/h0RNzWrZqerknfAIXjsfLVzS8Ogb8IRUf
	 X4kVrYIj1M24LRYOFOcRtdnqLb2p4+X5oYu88E+HghNRWaJ9nNPBQcKIN0qC9REj7dyT8
	 kItDyHhE6ElG6pjqQGWpDfNgibKk3DG8dnTyN/DZGoksapmusxtv5oy1prp2/W31/kA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=l5b68OsS;
	arc=fail smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9D7606A31C
	for <spacemit@lists.linux.dev>; Mon,  9 Nov 2026 11:10:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C9D7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=l5b68OsS
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D9AD83F2D1
	for <spacemit@lists.linux.dev>; Mon,  9 Nov 2026 11:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1794222638;
	bh=llvqyMiXnc/47moE8culPRvGGeNKWMoMtXMZ7VTfmpM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=l5b68OsSoga1Tc/V2WxA4LnSS//BWiPJpGdA0cGXiFcTBlGnvBHORXTaGLL7XMa4G
	 e+I8VXkaAzbWOnSSroPen36IXqwnm+TL0zSWTo3clnKWBnNIf2IkPjc85sxZKprPM+
	 iXWqANQ6gSUfM7u0VcE0pyu8zt6wNtsQgahvZGl0gr6suip1A+Fbndn+WxWEEWYjQw
	 omWLte5rceEpgUqp42iFM4RbuNdhFrKH4dJyqKJsFLyJLYCwZRHttHHim3azjBepEx
	 F9yhfqUw4hNgVLnlD2lBM3YNh5ok0UdnhoNNh6b7IqIGxi6jwrG4bfxX9p0WUCeVgp
	 ePZqS5u6oPrQaG06VdHWR+dfL5TRnpEK44Z6PFkFgqIyRLrNiimtvVRm3nc5n4ZjvD
	 xb2taZU+25gYSxzTrGkVdYZz9TqYWQBSFIqU+diuZDgbJHUjo2RVtBOSlwaJfomNSu
	 kp/GW6Fu6nFcxlBpRJxoEGAImYW/05j1DK/wSD0drL8wuFasa/w37cct0MJVNatX96
	 LxZXyhB0EHVup6u0ykAfTqIxSbSPNszseSddR8VjdmRZCs+hFZZ/hHTLUihHqqJVU4
	 HmDkjmq2dula8Gg/DGsjhtcIexSsJ757M1KfYP9IP9CqeZMHnT23dYIG4FNdX1asrc
	 hX/zRA2F82eS1qM017KND09U=
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c3f88d2ff28so60294666b.0
        for <spacemit@lists.linux.dev>; Mon, 09 Nov 2026 03:10:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794222638; cv=none;
        d=google.com; s=arc-20260327;
        b=q2b3zzOeShRw2PH3H9sJJLPzEH/fn/GPwdCrdjV60bMKfl3gnDckQkDGizbHyVV8pB
         bBZ3AsypSh5CmolT9xwgf/zo63wZvjS5n0L0/HbJ+Lg5/7gq+KyXnp8EYIeMFVzodZUG
         cPJXggGmXu3RzeI5wfWPhi0xwyTpyxBO6kpg/3ZQGoVvCQUM/xsMMLKuudN2qzlv9qJH
         aEiCbI0COTY0oqVcIzk0Sytxoi2pwL9PNk8Bg4YFgcdv2PMGSiEFP4g73TkrDb1weWFd
         lmfY4ynUko+zBkQD3jfI40sj+79h4LUv4De/sMcpBNIDHO8bVEBJhQVvhhLla8RPKhUD
         oHjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=llvqyMiXnc/47moE8culPRvGGeNKWMoMtXMZ7VTfmpM=;
        fh=QtPNiV8FDrNDALLZfwop3YFjRkBXhxgAZDIxDW8D+ck=;
        b=lVbG+6w0XwRqkG1NwNEquzj6GfNkOGr17XnY46Vph6CfEzAlnllf+4oyKQl8a4OGvq
         nLLH/Fno63s61q9fJ/azHAVmuqVhsf6Xw24URcnqmaaZpinrn6xJIKQHmhUVs+5g6HeH
         3FFWWUSWd3blAmNsoAFAgW1bRctO3VFgY7rR0vqTHQtMNPuc9gREfjQYA7xceJr0Cvkq
         /T6mUJdzRZpiSEn+wVQ5SqleZ3J1D4XvBVG4sVqLgFKeeV1HT5yWyvMZxOZlKCLHwzFv
         b8jBdbHYmvNpZbN8zUQ/LZV02OEAE/55+LFFgfylWEK6QuyXtsoqY9E30J8gv8GTjGgA
         lK4Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794222638; x=1794827438;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=llvqyMiXnc/47moE8culPRvGGeNKWMoMtXMZ7VTfmpM=;
        b=uY/hUCe55XQdM5jbT8NnNLr394sSstXtH80tQRWuAAO5g2aZmrf5NN4WZSejLsxM21
         Xh4CxudSlSeqsd2+HiZJpTf3wl/YvdyuUu53EGRFycbUsYdK8r9uXFSqBjS6NXTr7c1m
         m4n5IW3wDb/uGzrRrh5dPg5W2Y9IoOLTXEtXPwYcmVKZUF+oy6gDIab/aGkfBcat+Zah
         G0cdbTEdu5e6hPvLnL3kdA4xZ7CEPwPq0tyHwFdwxtk1rQAee7r/Ri0BKB+tteo9nsyK
         hqHXuEJX5QmUCQyW03Hwl2c4GDxLUljL1679cx0vcpKVvkEhMvaOuciKr2VZ3jIOKkWb
         nHHQ==
X-Forwarded-Encrypted: i=1; AL+hErHW/18k091+ZimnTugmu2mACTfxc1iaEnE7yFFUecr2gW2cjGaqZiniDjpcLH/q5Oa926h+8D9kDg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+kr7O/zHpj3/sOpP2LQh8yuQJr75hXjzb2TiyDgbG7OZhhTV4G
	PSE8XkaPgOIXbyXTU+kBtdv+CSDsIApOvdIr7ODAXHTn0b/CP6tfQe9bT0Z1wAMFYw5Hnwudzma
	RrDyiXVrgqE0JbWgd877NACWDG2g9uoyUPCUUgts/5kLpnQjEoAy+x1Q5b7cwkoqmXY0Y0l7lGM
	1shKHgeIL4qwc1nYvw7sk/MkcC7hcpELvyFZt554XU3MuWcOCOPxk=
X-Gm-Gg: AYBFou1MGO4hZtHDE7iVNbgbOb+WXQBrq+TYs4RAae4D5VnZ48WzjB8dE9NatVtFs2a
	RqdGILQ6tBJLXpNMmpoAYKKkcjbSPHBcaWksv5NS0O2oLONAfqDo2wL2S0Dx3v+/md60z8YR6Bb
	nilsYK5BS3Wvs0l8gQfqGLPS1/HW4Z+VCyVJRI4bkgAsUQjpFlOTo/zQs=
X-Received: by 2002:a17:906:f591:b0:c41:960c:8c62 with SMTP id a640c23a62f3a-c4d6daf39ccmr262303166b.30.1794222638461;
        Mon, 09 Nov 2026 03:10:38 -0800 (PST)
X-Received: by 2002:a17:906:f591:b0:c41:960c:8c62 with SMTP id
 a640c23a62f3a-c4d6daf39ccmr262300066b.30.1794222638061; Mon, 09 Nov 2026
 03:10:38 -0800 (PST)
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104-k3-bs01dcma-v1-0-794025247e4a@linux.spacemit.com>
 <20261104-k3-bs01dcma-v1-2-794025247e4a@linux.spacemit.com>
 <CAJM55Z9Yj87hqwMugqRsf_RL9np=KqzCj-J9RyutuWKd-w-n+g@mail.gmail.com>
 <CAJM55Z9nuO3MneQqBm3K2V2SjOXqXsZcDx9pMzVhxMJJ73xc9Q@mail.gmail.com> <DMNTD3S9CNW1.1H4CMNHDJM69D@linux.spacemit.com>
In-Reply-To: <DMNTD3S9CNW1.1H4CMNHDJM69D@linux.spacemit.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Mon, 9 Nov 2026 12:10:10 +0100
X-Gm-Features: AclHuK966um7PTpChOfRAdNHmU0xq_O_8ADd9fyC1m0kLv_yr1nWEQyElP2Eazg
Message-ID: <CAJM55Z_HOuvxNmAi2m3kjtQ3tuYEDNtfyvrcb=F-Z1p6K1VSCQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Add K3 BS01DCMA support
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Guodong Xu <docular.xu@gmail.com>, Yangyu Chen <cyy@cyyself.name>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Nov 2026 at 04:39, Troy Mitchell
<troy.mitchell@linux.spacemit.com> wrote:
> On Wed, 4 Nov 2026 07:43:03 -0500, Emil Renner Berthing wrote:
> > > I just had a talk with Dong from Spacemit. He tells me the
> > > BS01DCMA is the name of a module similar to the com260, only it has
> > > a different form factor and each module consists of 2 separate K3
> > > nodes. Similar to how the com260 module can be used in a small
> > > carrier board (spacemit,k3-com260-ifx) and in a 10-node server
> > > (spacemit,k3-com260-tq), I'd expect to see a
> > > common arch/riscv/boot/dts/spacemit/k3-bs01dcma.dtsi describing the
> > > module itself, and then an
> > > arch/riscv/boot/dts/spacemit/k3-bs01dcma-<something>.dts that
> > > describes the extra peripherals that can be accessed when the module
> > > is plugged into the server.
> > >
> > > [...]
> >
> > Ah, it's called the Cluster Server RV2768of much
> > https://spacemit.com/community/development-kit/cluster-server-rv2768
>
> Hi Emil,
>
> I've checked with our hardware team. BS01DCMA is indeed a module, so
> the "board" wording in this series is wrong and I'll fix it in the next
> version.
>
> I'd still like to keep a single k3-bs01dcma.dts though. The module is
> only used in the RV2768, and that carrier is essentially just cabling
> to PCIe network cards. Those are found by enumeration and there's
> nothing else on it for the K3 to control, so a
> k3-bs01dcma-rv2768.dts would have nothing to describe.
>
> Does that work for you?

Honestly I'd still rather have the k3-bs01dcma-rv2768.dts. It's hard
to predict the future and I think having the extra file is a very
small price to pay compared to the confusion of having
'spacemit,k3-bs01dcma' describe the RV2768 server and then something
else to describe the module, that's actually called just BS01DCMA if
someone ever makes a different carrier for the module. Also it makes
the physical reality of the RV2768 being a server of multiple BS01DCMA
modules more obvious from just reading the device trees.

/Emil
