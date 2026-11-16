Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.29
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794797695;
	b=Hc9WCHbwX1MZyVUQwTvCqP7Qy730HXqxMgMxt8SM91ioHddARiZNPD3PDywm1GC1OMTg
	 EolWXPuRI6nlxhcmGgxBLLoAOL1NyGfQkPmR3fiLOvnQnmsOFAadKEKMLm7iAZ5vYM+wQ
	 4NlGDWvhorxi21u1vdgJIkAebrJ0hYfYX60gz4kqbDEWadPR56Pcsr9SkXzhW9FXbpVG4
	 ana7dtRJSM8wDKhPpmzXgQA2kL7SR94L4L2bghsv7HkDVsaBNkXEtW/ldBjBbBouuyE7R
	 k0mXIxEpiBpJzu72sdU6YyHNW7Pyr9d4vqRDOZtDoX/t7Slr/1N2w/11/6dOswUR3MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794797695;
	h=DMARC-Filter:DKIM-Signature:X-Lms-Return-Path:Content-Type:
	 Message-Id:From:Mime-Version:In-Reply-To:References:
	 Content-Transfer-Encoding:Date:To:Cc:Subject;
	bh=LFNkNbE/BJjMMZVJ30Nnj44+C1fdsFY5EBU4BEDDicQ=;
	b=nPNDUpeD5NhLBRsmdlaQvhH8Q8GWKqmUYwEmYb4fRL4SHvCgOyhXiOwWkn2WwPneVBtn
	 1mV/S+lSHj47Smscti9IMuV9zH2J1tWeKT1fAANEXu4kcgZd3s4ef8zYaLhjh3L6Ayzas
	 fMcHgQywfbkyb+Cth6kcx4163MX501n8PUIrYj8+o31AhP78GKYQamW8w6PePg9TlDKNk
	 cHVKvV2glQF6ZXWKYbvyFaeNyaNl7ERAeX8XvcQhxMF2ariGRZW4RhzWmJfd08u/1ohDF
	 XEyZ28p5DX/WOA5SZDOortUOVhSDZZ+KUGswCYW+Z4bwkrKrowTZcu6JENSZUsQH0Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=16YLyYfQ;
	arc=none smtp.remote-ip=209.127.231.29
Received: from va-2-29.ptr.blmpb.com (va-2-29.ptr.blmpb.com [209.127.231.29])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7E9606A31C
	for <spacemit@lists.linux.dev>; Mon, 16 Nov 2026 02:54:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E7E9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=16YLyYfQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794797682;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=LFNkNbE/BJjMMZVJ30Nnj44+C1fdsFY5EBU4BEDDicQ=;
 b=16YLyYfQbcyz3cZNUAjyKBpGujVF7ypjPj8iR9/eaz7hjdUx8OZ5ZjEKnowaNINjZBtUl7
 90/5zh8XeyB4QE3S/1fBfRxqb35JLHitd307jfJcuDaOkYsjZnXcGTpKOHCNshptNS0AW1
 1nyY9anLM55fPLVeWkCCvBWdirSH4j8JKMqhxl4fO9/o9oNEaCvp+yFlWAS+xZ4OYrp24G
 aJ1Mo7ht+71askjNKTQKMQps6NbnkxHCNoZvv7a+BtUUyIDerRXbirUEc+Bh3iQEa8/SU8
 8Yed2XoDZ+rqXz0qkCrRqnUDdQlQR9Tcg0ciK/70kHS+qwc4N5F4uhf46dTKtg==
X-Lms-Return-Path: <lba+16afa7070+ab3e42+lists.linux.dev+sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8
Message-Id: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.c24fe633.1394.4ffc.88d5.f9ade9d7763c@feishu.cn>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
In-Reply-To: <20261114073025-GKA100523@kernel.org>
References: <20261109033154.361399-1-sandie.cao@deepcomputing.io> <20261109033310.361435-1-sandie.cao@deepcomputing.io>
	<20261114073025-GKA100523@kernel.org>
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 10:54:38 +0800
To: "Yixun Lan" <dlan@kernel.org>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: add USB controller and USB phy support

Hi, Yixun:

> From: "Yixun Lan"<dlan@kernel.org>
> Date:=C2=A0 Sat, Nov 14, 2026, 15:30
> Hi Sandie,
>=C2=A0
> On 11:33 Mon 09 Nov =C2=A0 =C2=A0 , Sandie Cao wrote:
> > Add USB device node (b, c, d) to DeepComputing FML13V05 board.
> ..
> > USB A works on otg mode, it isn't configured currently.
> Drop it, not really useful to mention there, irrelevant to this patch.
>=C2=A0
> Currently, No USB A port support is merged in mainline code.
> FYI, Chunyan submitted a patch for adding peripheral support of USB A.
> https://lore.kernel.org/all/20261105103125.2727341-1-chunyan.zhang@linux.=
spacemit.com/
>=C2=A0

Ok, I will drop USB A in next version.
I prefer to=C2=A0 submit a new patch for USB A separately.

>=C2=A0
> > - 4 USB-C Ports
> =C2=A0 =C2=A0 =C2=A0 ~~~~~ USB Type-C? less confusing
> > =C2=A0 =C2=A0 =C2=A0- Port 1: PD 3.0 (65W Max), USB 3.2 Gen 1
> > =C2=A0 =C2=A0 =C2=A0- Port 2: PD 3.0 (65W Max), USB 3.2 Gen 1, DP 1.4 (=
4K@60Hz)
> > =C2=A0 =C2=A0 =C2=A0- Port 3 & 4: USB 3.2 Gen 1
>=C2=A0
> For "Port X" here, is it a naming from FML13V05's schematic?
> would be great to mention which specific USB 3.0 controller (Port B, C, D=
)
> =C2=A0of the SoC it connect to..
>=C2=A0
> >=C2=A0

I will correct above to Port B, C, D.

Best regards
Sandie
