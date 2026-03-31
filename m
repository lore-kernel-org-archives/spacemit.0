Received: from va-2-36.ptr.blmpb.com (va-2-36.ptr.blmpb.com [209.127.231.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C264030E0F1
	for <spacemit@lists.linux.dev>; Tue, 31 Mar 2026 06:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774939105; cv=none; b=lJDECVgkXLuVAi+9dy/KCkMoE49mn8HpAUF4cWuJUHXL+R6ucaPAcGbr1Shehg4660P4Gnnz0H8NiNbnDcz1lPZO+5nG08P6ot/Jx7CslpH8RvPP1erwEgZ4w4kaAyD36SeEn8u2cEJtr9Vbv2DUqogJQIGFBvFakVz0bq9xfoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774939105; c=relaxed/simple;
	bh=IxNwq4JUnKlv/IxnLCJYxLfGCvCAtbvIR9Q4w+rLz14=;
	h=Message-Id:To:References:In-Reply-To:Date:Subject:From:
	 Mime-Version:Content-Type:Cc; b=DC0ERdfw4lPzaWV9niMCAe+ooglhO3Ot8gwiqEokvWNySLLrOWgptmUBoCoFaiDHUmSuLZ9p8jpNoN2EqiKjtTDs8VHxeostBE4IT7OxaE9+fjh5XFccOEB44gRSKnd2uUANS98IsDu7yvzXN+0KhAYgehIcSUy7U9hzNf9wLMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io; spf=pass smtp.mailfrom=deepcomputing.io; dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b=1uuAhGbQ; arc=none smtp.client-ip=209.127.231.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b="1uuAhGbQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1774939095;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=IxNwq4JUnKlv/IxnLCJYxLfGCvCAtbvIR9Q4w+rLz14=;
 b=1uuAhGbQTfbuUnv8ZSpdox1s8TZwMoKE0Q9gnAupkhEjmyMNThMOFVYS529mnlTLTo/cLv
 XvkvVLEY6HlhiiTZrb0TzLQIQHpmWYrIAzLd+GpangPiajF+qdNZjT6DrrsMTHYFHLqH6i
 Tc+A5wANVVJ6hs2t+ekVi2u5zFtbCoIzZBIfeOeSJ/Oi36cYa12VRmf5xhd8+QuRaqbH5D
 2mQfNxiOhEbB0rAMCDC8Ezp5b34L3ey02n9gRf086dLrgg/G5ZQk6WiKUOprqIbd2S/hBr
 xoiqsrQyT8IJqMZ8GdPKv5m4L3XJD15lA1vqLwP49Fvc4cdfhd2o3sFgJermdQ==
Message-Id: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.e358f129.78e8.4b7c.a3ea.c90229430d99@feishu.cn>
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
References: <20260331034423.67142-1-sandie.cao@deepcomputing.io> <20260331034539.67167-1-sandie.cao@deepcomputing.io> <20260331060344-GKA976850@kernel.org> <407ce3d77416bb2522b7906b0df3d5adf02c27ee.d811f619.24b1.431f.ad4d.c0bae1097eb9@feishu.cn>
	<DHGR42QJK86L.10IAY9CB3RZH5@linux.spacemit.com>
In-Reply-To: <DHGR42QJK86L.10IAY9CB3RZH5@linux.spacemit.com>
X-Lms-Return-Path: <lba+169cb6bd5+d6a10b+lists.linux.dev+sandie.cao@deepcomputing.io>
Date: Tue, 31 Mar 2026 14:38:12 +0800
Subject: Re: [PATCH v1 1/2] dt-bindings: riscv: spacemit: add deepcomputing,fml13v05
From: =?utf-8?q?=E6=9B=B9=E7=8F=8A=E7=8F=8A?= <sandie.cao@deepcomputing.io>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "Yixun Lan" <dlan@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, 
	"Emil Renner Berthing" <kernel@esmil.dk>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, 
	"Heinrich Schuchardt" <heinrich.schuchardt@canonical.com>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Michael Opdenacker" <michael.opdenacker@rootcommit.com>, 
	"Guodong Xu" <guodong@riscstar.com>, 
	"Hendrik Hamerlinck" <hendrik.hamerlinck@hammernet.be>, 
	"Yangyu Chen" <cyy@cyyself.name>, <spacemit@lists.linux.dev>, 
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>


> On Tue Mar 31, 2026 at 2:15 PM CST, =E6=9B=B9=E7=8F=8A=E7=8F=8A wrote:
> >
> >> From: "Yixun Lan"<dlan@kernel.org>
> >> Date:=C2=A0 Tue, Mar 31, 2026, 14:03
> >> Subject:=C2=A0 Re: [PATCH v1 1/2] dt-bindings: riscv: spacemit: add de=
epcomputing,fml13v05
> >> To: "Sandie Cao"<sandie.cao@deepcomputing.io>
> >> Cc: "Conor Dooley"<conor+dt@kernel.org>, "Emil Renner Berthing"<kernel=
@esmil.dk>, "Rob Herring"<robh@kernel.org>, "Krzysztof Kozlowski"<krzk+dt@k=
ernel.org>, "Paul Walmsley"<paul.walmsley@sifive.com>, "Palmer Dabbelt"<pal=
mer@dabbelt.com>, "Albert Ou"<aou@eecs.berkeley.edu>, "Heinrich Schuchardt"=
<heinrich.schuchardt@canonical.com>, "Troy Mitchell"<troy.mitchell@linux.sp=
acemit.com>, "Michael Opdenacker"<michael.opdenacker@rootcommit.com>, "Guod=
ong Xu"<guodong@riscstar.com>, "Hendrik Hamerlinck"<hendrik.hamerlinck@hamm=
ernet.be>, "Yangyu Chen"<cyy@cyyself.name>, <spacemit@lists.linux.dev>, <li=
nux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, <linux-kernel=
@vger.kernel.org>
> I'm just confused as to why this appeared in the body.
>=C2=A0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 - Troy
>=C2=A0

This was the format of my email sender.=C2=A0
I correct it now.=C2=A0
Thanks.
Sandie
