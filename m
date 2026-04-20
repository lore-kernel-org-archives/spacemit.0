Received: from va-2-36.ptr.blmpb.com (va-2-36.ptr.blmpb.com [209.127.231.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF6738D01A
	for <spacemit@lists.linux.dev>; Mon, 20 Apr 2026 09:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776677192; cv=none; b=KWiupOrhCy6fqD9rfDzi8x7d+ouOyqhn2wenc0iKpAJhArZrpKoX6qLay9cqR8GlpDRuKvjZ8S2zC9haNtExbfgjO781XNNigBU2DSfAXIohslc3GxqtiKKzq2epGDXOuqhgd/lcJM5ouOlP4QkquuWsX51hPQkKfKN5uapWWYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776677192; c=relaxed/simple;
	bh=c/cSJ0sI8II6L7VDGRHSSR6QMp4ljxaqU3hFC4CrDJQ=;
	h=To:Cc:From:In-Reply-To:Content-Type:Date:Message-Id:Subject:
	 Mime-Version:References; b=JXzLYeddT0XSEC3Up5VUcyX4y1uLlrUuYvM+f9vCmSR/boFg945DKfUIGR0LZjvaJUTD59pydQSRiNgrEyhKUxjqLcs20hbAqJffBFs3EObOOelmHS+N60QbBGE5LHTicMkWjHFj6p/EYlg/6/0ylGzNnCC36+RsBE72mYQuAkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io; spf=pass smtp.mailfrom=deepcomputing.io; dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b=zzYKpO4R; arc=none smtp.client-ip=209.127.231.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b="zzYKpO4R"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1776677179;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=c/cSJ0sI8II6L7VDGRHSSR6QMp4ljxaqU3hFC4CrDJQ=;
 b=zzYKpO4RdYsnzwOXiyX10AuJGEHclejLKx1tyErR/uT/Q/vWPKY9OqTcbSdEFnU9cepvnz
 KJkmf4tA60Kzyh0pQck4GhZHUtKIi5KqMwm11Yw0P9XCcLIMe94Qv7FfgSqOGXOREb5J7B
 lz2aEBhbicprLCSev4zsdtvMrjCxKdLc85ob9F0BNp6i2pnMcIgvEs/02iXmrjRbjv9/TG
 FPYgApo2a8+rImhRfIORlB1pli8sHQOIGytKvbEcdfw22npOblI4BoIiRm+EcT8hDYOZLL
 m1kkrGPqAcjsIhXWiOW4uOanR8BOaoM1mytonp0ki8fhljOKzQr60iNKy117Ag==
Content-Transfer-Encoding: quoted-printable
To: "Yixun Lan" <dlan@kernel.org>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Krzysztof Kozlowski" <krzk@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	<spacemit@lists.linux.dev>, <linux-riscv@lists.infradead.org>, 
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	"kernel test robot" <lkp@intel.com>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
In-Reply-To: <20260420090936-GKB203300@kernel.org>
X-Lms-Return-Path: <lba+169e5f13a+f6a46e+lists.linux.dev+sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Apr 2026 17:26:16 +0800
Message-Id: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.5595e961.9ee2.4959.8935.9a8f33812b0c@feishu.cn>
Subject: Re: [PATCH] dts: riscv: spacemit: k3: only keep spacemit,k1-i2c
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260420083931.1427703-1-sandie.cao@deepcomputing.io> <dfa3f1a7-f4c6-4655-94c0-326f88db3896@kernel.org> <87ef529e-b591-49f5-9fc9-3099672e2f0f@kernel.org> <DHXUQHVK4XRN.3CVZ3GH75L4L4@linux.spacemit.com>
	<20260420090936-GKB203300@kernel.org>

Hi, Lan & Troy & Krzysztof :

> From: "Yixun Lan"<dlan@kernel.org>
> Date:=C2=A0 Mon, Apr 20, 2026, 17:09

> Hi Troy,
>=C2=A0
> On 16:50 Mon 20 Apr =C2=A0 =C2=A0 , Troy Mitchell wrote:
> > On Mon Apr 20, 2026 at 4:44 PM CST, Krzysztof Kozlowski wrote:
> > > On 20/04/2026 10:43, Krzysztof Kozlowski wrote:
> > >> On 20/04/2026 10:39, Sandie Cao wrote:
> > >>> Fix dtcheck issue: compatible:0: 'spacemit,k1-i2c' was expected
> > >>=C2=A0
> > >> Missing space after main commit msg.
> > >>=C2=A0
> > >>> Reported-by: kernel test robot <lkp@intel.com>
> > >>> Closes: https://lore.kernel.org/r/202604140259.eKDaxKua-lkp@intel.c=
om/
> > >>>
> > >
> > > Also, the file reported in above warning DOES NOT EXIST (I checked
> > > next-20260414).
> > In Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml:
> >=C2=A0
> > properties:
> > =C2=A0 compatible:
> > =C2=A0 =C2=A0 enum:
> > =C2=A0 =C2=A0 =C2=A0 - spacemit,k1-pinctrl
> > =C2=A0 =C2=A0 =C2=A0 - spacemit,k3-pinctrl
> >=C2=A0
> I think you refer to wrong file, which should be
> =C2=A0Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
>=C2=A0
> > So there's no reason to use k1-i2c. As far as I can tell, while they ar=
e the same IP,
> > there are subtle differences between them.
> >=C2=A0
> But yes, the idea is correct, so NAK to this patch
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Troy
>=C2=A0
> --=C2=A0
> Yixun Lan (dlan)
>=C2=A0

Please know that, I send patch[1] to add DeepComputing FML13V05 board devic=
e tree.=C2=A0 The patch is based on k1/dt-for-next[2].=C2=A0
And it meets dtscheck issue:
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202604140259.eKDaxKua-lkp@intel.com/

On k1/dt-for-next, it doesn't have spacemit,k3-i2c in Documentation/devicet=
ree/bindings/i2c/spacemit,k1-i2c.yaml.
Or I use the wrong branch?=C2=A0

And what should I do for my patch[1] ? =C2=A0

[1] https://lore.kernel.org/all/20260413060524.1235982-1-sandie.cao@deepcom=
puting.io/
[2] https://github.com/spacemit-com/linux/tree/k1/for-next#

Best regards
Sandie
