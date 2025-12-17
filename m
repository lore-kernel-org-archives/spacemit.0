Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91CB1862A
	for <spacemit@lists.linux.dev>; Wed, 17 Dec 2025 01:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765934599; cv=none; b=hlKAiG1cfSRNA0yjsiNbZ9P80d0hHaIIfoJzDag0vbiMhztm+zvYmG6VWPkaI7/KKS3eEvxNp1edJjhRe8YwvNTtR8hKs6OcSH1T5fe9ZRR5ZzMnA373g6YcozyLqxN6bXOuxrRb3zcii9sOdWozPJpsZnRlL2HoTryinhoQRuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765934599; c=relaxed/simple;
	bh=yXSiB1Xb8XhlVaTSYdRfhglLs0Rb0EeSwWMMmodjhtQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MzGmylinWH3S2ikk+Za1B3KiSnAnQCnn2L5Zf6Rut9eIwqSdqy5fXKTscoD+cvrxBskJLrTAm+rnSpMdOVqGyf+5jn01UxVE3Oc5geP4NSh1yPVVFo22FghvGOEb8DMYw1reRE+n5bY+jeNgS/0eHDY4frD8/Yg2VQJGc3+87lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=HwuIpuNp; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="HwuIpuNp"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6420c0cf4abso5438524d50.1
        for <spacemit@lists.linux.dev>; Tue, 16 Dec 2025 17:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1765934596; x=1766539396; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=20u+Yo9zixTpysc9eprKHwVlPvXZQniYnu0FOsSjV+s=;
        b=HwuIpuNpgCxB+5Aw7JCShkBW1rQM438hOA7sxOXeo24HcflqNBmVfFspKOiliaKpHS
         Mx7zWU86bocRx6CxyHoe2blMdoZxRHRwhczQoVqXRY81FQmHGVvqWPfKZifW4n2ps8Wr
         0Q6maKY81usQPGSrCDIKYHvkiekX6iUxwAibkoZcpT/mP8qBwJESrlqjgXLD0heYNW6y
         UGhMmmzYdJ+lERo/d6mKfYkHI1zg+bTiSmqJeMoLYKjykZNM3yZDV+774PwuT6MvQuvu
         0fUCgZI8Ipi3HNzgiMLW6MhlCN9/uCFGvo9ngd6x+4EfG5/CYz73aXA0cbpqSXwtKruL
         9ZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765934596; x=1766539396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=20u+Yo9zixTpysc9eprKHwVlPvXZQniYnu0FOsSjV+s=;
        b=jKSx71K8iYVe6FrIt/6wOFnimyhz7yuctRDWNoXQioxek9RBcvDY9MM1HMyJ47y1vl
         3DWptc2Nr3DDcfvys70PI0cLvwKdWueSoRcoQ/CqR2RpUIaE368767euYB9nqWk85PZA
         K6yG/qtWqku+kGEDL4Y22ghP2U4gp6bQqJzHObADphNNic+iVs9qyLJJ0WmePIaitzQC
         8m8DA5mRxCNbDvPMVFgO8+dszSdVBOYx9GXEj3r6lj/ZacQsRVuSTyY0gyTB7kMCTmne
         OsOm91KLt9o195jKfDFR7oWR5Lb2KSTJ/Sa2GkS/qJHlwHeo9T16y5T0ccsumYIEuaq1
         XUnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNjLfVWjelmsw4SCsZ3OQJzWpj9ngUq6kvJ31bF9MbRQZTeBipsnW5vieVOYUHxEBYwsDMbInJqg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8IfjHOgfqjafW9RGc9yI4VMr8+2C7doBc4CECBezzexs9eNUk
	rO3RtglshjJlkyB0zTNMARaK00KT+OYfPfvqed3jRbMlADrWctEwT0gTqSjxXnCfpP/Ei92U42p
	pcdFjXzNS2lhrzkAM4Y20qfyOitvO1vMw3oMSdaDqlQ==
X-Gm-Gg: AY/fxX49bEbOSiaYEH/ZosmK8Nd1BPy5jYUwbJEL/GhTRNODansmo71PJQe6eKaaSHQ
	lxRho7CMFVzs+9Qooxyj/25hVyiyIlJ3Yj0jFTd5tb7tkGZfNN9/JgW9BaWIyGQNDEhrZwcWkB5
	kt8WkzKK45zkOWOrKMkc5Dlk/wGWM71TlEPuWFODsyxdVQ9ZKxRrNOeko6e2R/csWeNVJ0zNtfS
	Yrxh/1TiLPIndXz1yQYgHPkNzwT4AVtxS4x1MOHv6/6MgUyagjgqWqRvqbsYrS6puDxiGF3aJoX
	KILebhswORKe7FdlUa7kcio5vw/ATHvw65QQka/gtMgU
X-Google-Smtp-Source: AGHT+IFO05qMq19SSBI4gVmifTjzTpnb7vNwVZXOZr/LC4PrjB13iviO83n7Ke+Aymi58gBSK3b0Bq+DG4yndiKAVvo=
X-Received: by 2002:a05:690e:191d:b0:641:f5bc:6961 with SMTP id
 956f58d0204a3-64555664287mr10955876d50.77.1765934595707; Tue, 16 Dec 2025
 17:23:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
 <20251216-k3-basic-dt-v1-6-a0d256c9dc92@riscstar.com> <20251216150530-GYD1903981@gentoo.org>
 <20251216-wing-squander-2fed378d3035@spud>
In-Reply-To: <20251216-wing-squander-2fed378d3035@spud>
From: Guodong Xu <guodong@riscstar.com>
Date: Wed, 17 Dec 2025 09:23:03 +0800
X-Gm-Features: AQt7F2pscWPGj2PRq6RScSaqgPax4HcbFJUbL6PI8fgs-Pvj3uUzlMNApnCVER8
Message-ID: <CAH1PCMb+Y6zUCpUNdMYfB3trKuEUsSKQ3kCn+wjoj2UA4o_CPw@mail.gmail.com>
Subject: Re: [PATCH 6/8] dt-bindings: riscv: spacemit: add K3 and Pico-ITX
 board bindings
To: Conor Dooley <conor@kernel.org>
Cc: Yixun Lan <dlan@gentoo.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Samuel Holland <samuel.holland@sifive.com>, 
	Anup Patel <anup@brainfault.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, Yangyu Chen <cyy@cyyself.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>, 
	Heinrich Schuchardt <xypron.glpk@gmx.de>, Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 17, 2025 at 12:33=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Tue, Dec 16, 2025 at 11:05:30PM +0800, Yixun Lan wrote:
> > Hi Guodong,
> >
> > On 21:32 Tue 16 Dec     , Guodong Xu wrote:
> > > Add DT binding documentation for the SpacemiT K3 SoC and the board Pi=
co-ITX
> > > which is a 2.5-inch single-board computer.
> > >
> > > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > > ---
> > >  Documentation/devicetree/bindings/riscv/spacemit.yaml | 6 +++++-
> > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/=
Documentation/devicetree/bindings/riscv/spacemit.yaml
> > > index 9c49482002f768cd0cc59be6db02659a43fa31ce..003b0bc1539b621e39172=
a0565dfea1274cbc8b8 100644
> > > --- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
> > > +++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
> > > @@ -8,7 +8,8 @@ title: SpacemiT SoC-based boards
> > >
> > >  maintainers:
> > >    - Yangyu Chen <cyy@cyyself.name>
> > > -  - Yixun Lan <dlan@gentoo.org>
> > > +  - Yixun Lan   <dlan@gentoo.org>
> > > +  - Guodong Xu  <guodong@riscstar.com>
> > please simply use "one blank space" here, it's more consistent,
> > trying to align them like this would result in even worse situation..
> >
> > - only email addresses got aligned while not user names (first, second
> >   name?)
> > - adding another maintainer in future may break the alignment (if long
> >   name)
>
> Yeah, these are never aligned. Just do one space gap.

Thanks Yixun, Conor. I will fix that.

-Guodong
