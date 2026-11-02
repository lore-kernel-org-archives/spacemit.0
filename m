Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622389;
	b=d9yO81L9eCqd8w9Pek5kIkSK3rbhd1MtvfOSuwSi02IAg3dWHCyMYjk8V9YBaFLGFhIw
	 5yAyKDgDiYiCIag1jW3jkfbq9+n7KEUnmBpeWo0puFHfODv3D5b24hWkU/e+9lWINlDGJ
	 HsXzIbwyWwljqwABivaAQ7hN23yap6GlldG53mH5O7IrUQCFFzEDN55lMlIJyULdsZERM
	 BPqP2aJS2RaKOhpen15DuCbpPLKf6/cSJpKkUoKmpdOEYRtuLfspcZdAKl6QkTVjzOQNb
	 m6g5waJkIC87aYTLRqZ4hwXV00O0RV2KnSk3hl5EIktrCSID7rQUekzQFoj9L/vUjsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622389;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:X-QQ-SENDSIZE:
	 Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=kYoEHv1yJWT5CYnv9W1t01akAHdAj5zwmImIgwGqYBU=;
	b=NI2+/yTpWFUPCjKHzkYpxSKw3PW3AQo27INJ05SWbKVf3NijpE7k+S0UvqRpyGWjk5PX
	 naB+yUd7TtwHj/Q1cpveGEHxZwvLTbQAan0H6ZkIATeiWbgM5To+WHTKkWLgM5W+wNxKG
	 h6sRyfl/Ul6yhtKpsBYEB/Zj9q7UgqWwMBPWRU8Bva13laNOq2hdiRdP3396sZAPtkF27
	 G0C7PXfmy5idQWfw6MDa1tsSDvsmjCOOwAz6XimSijJXenRr7ayVjh7pw+CyPCi5yrsF2
	 UjHeBVPSzoeZdGVJCzdX+WnxTI4M6aJ+JEbE7wiSE1u8uyAjdVty6s1OXkcZLahMHhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=tHgscYXC;
	arc=none smtp.remote-ip=54.204.34.130
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98548606D269
	for <spacemit@lists.linux.dev>; Mon,  2 Nov 2026 12:26:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98548606D269
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=tHgscYXC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793622373;
	bh=kYoEHv1yJWT5CYnv9W1t01akAHdAj5zwmImIgwGqYBU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=tHgscYXClrjKyQw2FMEX5Xyowq+WP1+WQDdxI+e1uHdfcFglLkooSgF5ppTNYOWua
	 bYd58MvBqI11sQutis01e/FI7QtsSKaMa8BLmZ08V79jd5/6W7fzzWX7u/NhrmMBPJ
	 aJBLppXIfO1ZISVPHPj/w/7S+tW4oqM+nxOVtGfo=
X-QQ-mid: zesmtpgz9t1793622369t8252a1b2
X-QQ-Originating-IP: YOATDWUT5DqLBTpypXLnMmk5msUG9NC5MVQmrCdfgU0=
Received: from mail-pl1-f171.google.com ( [209.85.214.171])
	by bizesmtp.qq.com (ESMTP) with SMTP id 0
	for <spacemit@lists.linux.dev>; Mon, 02 Nov 2026 20:26:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1461798402967377883
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e9cf928dc9so18273715ad.0
        for <spacemit@lists.linux.dev>; Mon, 02 Nov 2026 04:26:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBx2UI0So4fmH2+PrY53t/XWOmqfurDrjcuoV8C8QERZg3mFpTaAaohxdob5CoD0fb2YNMg07ZPbvA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8CyrLrD2zu6b3zSNkJT3xTvTuNP8dQaNA0KCf+rwfVS7qdc32q
	knmssMoNXHsQZ5Ufygngs9IedansJo2xpz948QXVzMZP3XeFHCxe+fwHYZwr9qegRp63FYZhodb
	+C8Y1t2rltIKAt37Sy/mp3HJEhqE7730=
X-Received: by 2002:a17:903:1212:b0:2e9:fd49:64a with SMTP id
 d9443c01a7336-2eb3640f012mr65226725ad.1.1793622366169; Mon, 02 Nov 2026
 04:26:06 -0800 (PST)
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261030094024.3226356-1-chunyan.zhang@linux.spacemit.com>
 <auYxFRtKWbGAlRTL@aurel32.net> <CAAfSe-shesRwmdKhZojqbZjJejVEtA47NXBwNmrpAsTsk6m5rA@mail.gmail.com>
 <DMKIFFUY4T1C.TTDVVD0FOSF1@kernel.org>
In-Reply-To: <DMKIFFUY4T1C.TTDVVD0FOSF1@kernel.org>
From: Chunyan Zhang <chunyan.zhang@linux.spacemit.com>
Date: Mon, 2 Nov 2026 20:25:29 +0800
X-Gmail-Original-Message-ID: <648788BF6233AD63+CAAfSe-uMrrX2Y_mzt5-Hhr+ssfwLVhs094PBb-ZTgKFLPwVjgA@mail.gmail.com>
X-Gm-Features: AclHuK8Nf_Wjx0Fs3iSP6YTyXDr4sshL9mP7vgixNBtorqmmqEdGoXFlzXEdNkY
Message-ID: <CAAfSe-uMrrX2Y_mzt5-Hhr+ssfwLVhs094PBb-ZTgKFLPwVjgA@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: spacemit: k3: add USB3 port A (DRD) nodes
To: Troy Mitchell <troy@kernel.org>
Cc: Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org, 
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, devicetree@vger.kernel.org, 
	linux-riscv <linux-riscv-bounces@lists.infradead.org>, 
	Troy Mitchell <troy.mitchell@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: N+HmzSkqQVbeWiKTILBdlr0bNdsSlb3b5kFp9wcxfLeSP/nUGkn+DWNb
	LJoS+4qP1H0JIaQfK+yKsWIGuzTHuMU5g1p7kHlJJ2eMTZHUpkjjb1wrVzreOY2qqsqjDk+
	gASQ4YSWGd/nap8dpVpXz5fSBRXdxqrU3DW6GRdTueLP2klZJEE1iI6ezzHrGuPyM+h0KgW
	79bSyZjYFxOwDwQttH1UJxGB1VuEUbsASxOd/Jnm22/ww/icXclmhqRUGlQvpVGgJFxUVuh
	FLpanKPFvjhKgH2zOjRDb0EHq25mZ9mjgAV0xPPZgrDJzvtju9P2UaPnGbO82dBMtXkTZq3
	6XqHWwXrihV2u6qmfGGG85csujs5ASQB/o03HbQgEvotYOoR+J7VZ9FH4HRL8a0jeTnsJGl
	f9oUB/Pc/MtypPmJ7GcWlBkIbUSd2Sp4v9NJj3lFEAGZEDBP3RlTXTPiF7WEg/y2Akho1EP
	idzk9zkFfT3sSSAyIgitME2EIErDtUeShhMVbW23W/lva5z0alsdFLwOtKEcH1GXzFP5lgm
	+MHjFgnN1bcfKlfZntK1SjU1f7Ct9VeQFTex5ee2PNYLzbKcI2Pq+p5a4vhfUmFb0eJzopP
	kZCUgf+p+AJxkLbldPXfydPS+2YyNLu531CEprAErPy2mNkp4tXqelFpZ1I3AAUTw+aJNAK
	BiVd3TR0SQ3O6KbJZtFiceukxygo93IYqZjwCD2cUj30/WbpPeDqhm4peyTkfJWcscO8IKn
	+k2dR6PpUYfy34DKasI3vJOjkJ+P/XvzCvrgPUzrf8uxSsJn6pGy4HF9B0qQsIKvBez6vKb
	l5hbCjJKct3xsStwf+iZ9u1H/nJeXMSowBVsm1Dwrc6oiH80csp4dixVwqm50Xm8HVpUK5K
	zklG0o01tTVkiKhzu+s4QBzLHfoDaaiHS4mkp8YxBg0lV867Zs19G8cQSuSvqFo2EQ7lm9x
	r3lglu4+gJ0hxtEUOhuk/mV+hOPfXBvC1ZG8Q+T7uK1ddVJQHbBx4sBAuhMmDjTXSNthO/d
	vP6NCHOrORG8nD+WSqdBF9HArBhbOa+coacm7hH7xzOstzZc9W/YAuSJK4r8DJxkPXOcswt
	A==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

Hi Troy,

On Mon, 2 Nov 2026 at 14:27, Troy Mitchell <troy@kernel.org> wrote:
>
> Hi Chunyan,
>
> On Fri Oct 30, 2026 at 5:40 PM +0800, Chunyan Zhang wrote:
> > Describe the DWC3 controller and its USB 2.0 PHY for USB3 port A
> > of the K3 SoC.
> >
> > Only the U2 lane is described: Port A's SuperSpeed PHY has no driver
> > yet, so the port runs at high-speed (maximum-speed =3D "high-speed").
> >
> > Enable USB3 port A with dr_mode =3D "peripheral", so it can be used as
> > a USB device.
>
> Port A is a Type-C port behind a FUSB301, so please note in the commit
> message that it's device-only until the CC controller is described.
>
> Was this tested with a C-to-C cable? That depends on the FUSB301's
> power-on CC mode, since nothing configures it yet.

Just tested,

On K3:
~ # ls /sys/class/udc
cad00000.usb
~ # cat /sys/class/udc/cad00000.usb/state; echo
configured
~ # cat /sys/class/udc/cad00000.usb/current_speed; echo
high-speed
~ # cat /sys/kernel/config/usb_gadget/g1/idVendor; echo
0x1d6b
~ # cat /sys/kernel/config/usb_gadget/g1/idProduct; echo
0x0104
~ # ls /sys/kernel/config/usb_gadget/g1/functions
acm.usb0           ecm.usb0           mass_storage.usb0
~ #

And the host side sees VID_1D6B:0104 with no error. This is not
guaranteed across all C-to-C host/cable combinations =E2=80=94 will note in
the commit message that Port A is device-only until the CC controller
is described, and that C-to-C behavior depends on the FUSB301 power-on
default.

Thanks,
Chunyan
