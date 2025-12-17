Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A2823C503
	for <spacemit@lists.linux.dev>; Wed, 17 Dec 2025 01:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765936492; cv=none; b=tq6vUHbiY9g6FTqfK3Pov8Qk3HbPnmlF2YD6hCOf4k1fSRmUAs394u+zJjrlT+7gJllo+Eet53Ak/mrpHTMqPvcAyi0koZOB5WmrlKrbDnGLpVgJR+bCLIQ6GHeMfK3xMazOQ/VN9EtP07mh7ZI6dpSZ3qOC+EkOD9qSWWBXpo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765936492; c=relaxed/simple;
	bh=gFvWaYCOh0lh6xwcjS7rbDHXUIghg5O7MRfn/Hq+iM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CY+UDu167s3NoMXjcnr66rcyD+kiXP39fJbAhxoFj6aRqR1eenrgUfR8Szhmm3sREx1DQXnjidqUfoHUnem6nbC9tT004aOX1/gyZsGl5IU/Ben+G6ab9BspvqsjNVVIzkJBMOjBakLfa7cs/EqQF7XWJsXCU5/Ur98+Fh04dSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=RC0pRaOt; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="RC0pRaOt"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-78c8d74bf4cso45974047b3.1
        for <spacemit@lists.linux.dev>; Tue, 16 Dec 2025 17:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1765936488; x=1766541288; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sd7QPHCVU5Iv6Zimvwat/hwwusR53tKu2g3puM08IT8=;
        b=RC0pRaOtNnxQz7pbF8ZjCzESUqlyvEQLc4Nzso+wfY8qG0qKY58eoK6/kKXnd7SDWq
         ynkjR5Csbld8p1+TJzqwndkH7X5jii3W/IztbgCq2EH9hPAXROIMMCk5yRxdOi0J/IW5
         /ICj9z2PEUDstj3IMrIGgen8a4iHE6Iz2ymvpku5OXvjqqX/sBAseaOaH/LF6jfyTvC7
         6fYKs8mpJHLC6zktyPr1lmngbXSjhp1AI+lehN7wVztzmclWmDE/oMhiFvVs9vJk2jL8
         ObMO0J5NcVikU8RN3WI5h5hmyuOc5s1D/H0VxZvlAdKAFiWyt35qywlpHDNo3vh0e3Pm
         /HVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765936488; x=1766541288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sd7QPHCVU5Iv6Zimvwat/hwwusR53tKu2g3puM08IT8=;
        b=OJKez9D2YbvQzpRt5F3uFuEiADIUsO6Tj+0NcbopiHXF7GRp43TiD7OK/zRJjQBru4
         EWxts5c5Yd8DwZheNztkvl8fGDN3cjg3Lw9UmowvElX5ejMUx7N2A0eBmCFqaTuKBvko
         9QlgeCUPe6qfs8FLCMj5zJ/ytmOujkjDOXZUEpPLnxMPjEw9lf2AlhfL19sVzCo7qlX5
         HMlzGouhN/1dPg4/6qyLTXBeZ2MDTbwjCtx1/hw7Kuk3p2hd9qY4yrIqz8GgVtZ8vab5
         xyXI/LqALYaMSDwIsalyrQeMhrcjoXnBg45CALW8BCldvkEerlkMowtrzeqN4dgRuMRs
         gBcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUh2sUHcUJp/F6NeJ1U8FmOrQWvJI1eLuQh9n1RI7LqLUoKagrfVapbrqXJEeB0O7oBJIWLOAF2GA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4o6ILPaaW0xTJ8I8ftSG9cKcSyv1Hr7roanbC56Sq+Y1AghCB
	56fKd+XSWTgxoEGxnxaBS2YKflz5sBamLb0QTs4+B8Ji6mG5R5R1vKyDjZI25zoO9YwfH0osg7y
	WZBIznQEFqXOAy/PF3QiELNXDotEZjF01EWKPubk42Q==
X-Gm-Gg: AY/fxX7Hjrz1YneUAizBXqMQWK/R7Pk0DhS21cuCJJncZCnKGe/Q4eXEStg9H5XPGFI
	qz+rXYxzq1GUPb/1Sl6txMhW7skvElexroD5dqPSPSXHKOysRzE3OzU15uKyr+0x/4LHL8bkAUD
	3ZrENKeuORhIUniIf4m2lg6ooS9EEnzXEKj9WBtwxHjBd+CaOtr+4jwhXd62PbwY58yk2YqIFwV
	gRAchFjeXWh/uenvIlT7XFsg8R6UnQkDfo4NZm+ojYjSwIf3qCmQW/14olomtSw3vrb8vfO24JU
	NMHOUjZn19l+zH+zxeOngFREweodpkOqbY8SYaalr54q
X-Google-Smtp-Source: AGHT+IG7RmyYUv9Cs29kj2dxdrYXc3URbz5VHNb0PZI6tD2ZWGH5YXEmhQNocOw3g5bSfsZIoCB4/P4XTUm2cXg3BYw=
X-Received: by 2002:a05:690c:9a0e:b0:781:64f:2b63 with SMTP id
 00721157ae682-78e66ea4ad5mr150059267b3.63.1765936488525; Tue, 16 Dec 2025
 17:54:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
 <20251216-k3-basic-dt-v1-1-a0d256c9dc92@riscstar.com> <e596f624-b4da-4c93-910c-b3c35917eb9c@kernel.org>
In-Reply-To: <e596f624-b4da-4c93-910c-b3c35917eb9c@kernel.org>
From: Guodong Xu <guodong@riscstar.com>
Date: Wed, 17 Dec 2025 09:54:37 +0800
X-Gm-Features: AQt7F2o5HH0qUzMTVYR3bdSsKGKqc250kEEJ9XB0OvFRDAn2rOZynYGpODwCBsI
Message-ID: <CAH1PCMaKpeATkt-ygN00tYGc1_-DVzBgp2QdfRfmUJC4+RrhoA@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: riscv: add SpacemiT X100 CPU compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Yangyu Chen <cyy@cyyself.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, 
	Heinrich Schuchardt <xypron.glpk@gmx.de>, Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 11:33=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 16/12/2025 14:32, Guodong Xu wrote:
> > Add compatible string for the SpacemiT X100 (RVA23 compliant) core.
> >
> > Link: https://www.spacemit.com/en/spacemit-x100-core/
> >
> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > ---
> >  Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Docume=
ntation/devicetree/bindings/riscv/cpus.yaml
> > index d733c0bd534fb63ed7c0eada97c42832431f1fc1..cce87092dc7749f49066154=
d9a256af6c7b6c19f 100644
> > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > @@ -62,6 +62,7 @@ properties:
> >                - sifive,u74
> >                - sifive,u74-mc
> >                - spacemit,x60
> > +              - spacemit,x100
>
>
> Two reviews of this one-liner but no one pointed out that sorting is
> broken... What is being exactly reviewed in this one-liner?

Thanks Krzysztof. I will fix that, put x100 before x60.

BR,
Guodong

>
> Best regards,
> Krzysztof
