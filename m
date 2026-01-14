Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BFA38B988
	for <spacemit@lists.linux.dev>; Wed, 14 Jan 2026 22:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768431313; cv=none; b=BL0CNK/kBPLrPwB6QsqzGyG5HVGIYNrFHnShsiRkA2XGAwP/YUcXQSrYUCzd1X1AriSCIV9E+CRn79myaxrJC8+ighSwcNtW0Jqykaepg3/CzAQXUcbf5jqyi9ItlUlecMLcPtycUJc0xdlztM7yKcxe7cPXVlGmzxQf2l1fDlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768431313; c=relaxed/simple;
	bh=V1py82AjhxEE3vmI27KtbVxIIIMpzO9ROtiUPz6KBIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZeqnAR/a8QBmiY/HpU1Fz6kI6xNq862DUBmFUziLPR/JOIL/2Y1TuO0alFqY+Bk1bLfn+CJE8rQEVUAGvuHiYcryaowe14yBSh+K8kglwBVZT+HCAWTPi1lnbDrYDB/JdNO8sTMD1QCELzjCiblnul7w8TMDGd5IpCtsdrjjsmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=sEysIDnI; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="sEysIDnI"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-6446fcddf2fso241705d50.0
        for <spacemit@lists.linux.dev>; Wed, 14 Jan 2026 14:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768431308; x=1769036108; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R3aA2X7iGQsnnel6fRLVe4SLr2+v2d/5zouhV3Vlqcs=;
        b=sEysIDnIsz6WpOUmSicSxKOrFQft13p1iLkYprPtJcmkkau46CxfQMK4rCUqD5b3xO
         vkSNZqLl7HRJHbhTrgG472PXOv0TBCzN0/mZ0BKD2u5++NxJT5sB02qhR8H0/3dgin1x
         ZfG6xw54ekSqta56b4RKZQHZMKiIVLP04jCfpks8HVmkqV0qteMJ3VNDbV286eqGX2AP
         LuFGIWmmINY0lwA4rOIYgDaK+hODO23mz9HyBEp0PkoBxpYKf1+Oahabl0MRCK6QKxqQ
         eOudmlKBAiNy57eGQhCbTAT280WQ3yXfTGR1A5VnOUBk8sXaQsWRtfAfZm4kTl/lD+il
         L+aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768431308; x=1769036108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R3aA2X7iGQsnnel6fRLVe4SLr2+v2d/5zouhV3Vlqcs=;
        b=PqfHuruKFTh8W52NB41uj1QeUhP2DWwaFnsp3UvbNriumb6e79oCuKtXsI5n2V/8bn
         9Rt+/nnn4LSuvTYHfGtaISHJjOqHPi3kA9tOexnYnX97HFhO9+yFAv026ueFsUOamby6
         WYs8vZuaLV6HZQwykFBNL1jyt14jDcZhSkD+zUpRtQoy3iREwZxclD6527Rsj2T6KRJp
         oyd7HwI2O6/zrlErgflgcvaoyTn+FmieGvIz6DqzV6Lyso4kQLdmgQqgQmCysnwvDc5P
         /tXVx1YwJ7rR0qkVeGobuFqCIHYk4yIxcqP/mpkEpyE0vJyjTN+TrABY4OrOvgnxdM63
         iEaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVi3AkVge+P8QPShF1PzXPFGUKrV0MM4x02nRSlMVhixVWbJ3BKiFutwvMDU07vS+ZhunTSanEjMw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxHX213f4Y4UKIsqEiuWYP3ihfbsn4YT31K465wB1YWQVNMsixt
	SY8/oBNSN4xECDoELk9PF6Y/xL6o5G15r2aK8y5MRa9fXfz2Wl074kQMVm22gc6BzhaVPt/OwAi
	4SmU09XM9sZFU0sdd8r3HH4Khm3RtwFyKVFeXY0iGOA==
X-Gm-Gg: AY/fxX6YWlp9RdBRWwiEb/XkIbpyMX39Eoaccb9rj/OMGy/wZ+gHhQzTAPLDiHEW1RO
	DbyhcU+hpSrQ0aYS1x+hT6HsesD6cqQEAPnO30TYKyFGkIGNtXw8KeR2bPMR5t6Hf3ABHlsBMm3
	RjdXhUjaJ978Uwxch06NqLajZQBG+xNIihmgS24zdP4zg2RpBkcEoYrhICugU79t6fdRDN0o2xt
	fVefyZhKUtveGhSXhg10XHux8vE7Qc0vRgxeSN65/LWiVb10skMpJi2trywS6vkw4F8LX/QJ//p
	FjJzg0ga8yIx4aFuhAAYXBX3Jput+L7OrARTIQ==
X-Received: by 2002:a05:690e:b8d:b0:644:77bb:5705 with SMTP id
 956f58d0204a3-64903b55ebbmr2982962d50.77.1768431307959; Wed, 14 Jan 2026
 14:55:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260113-adding-b-dtsi-v1-0-22d6e55d19df@riscstar.com>
 <20260113-adding-b-dtsi-v1-2-22d6e55d19df@riscstar.com> <20260113075339-GYA25466@gentoo.org>
 <CAH1PCMarzrZJ072iyAQthB-i-LHFCSJ+tZLx6HcWiVcUrQeafw@mail.gmail.com> <20260114-evergreen-gluten-b1c8558e7684@spud>
In-Reply-To: <20260114-evergreen-gluten-b1c8558e7684@spud>
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 15 Jan 2026 06:54:57 +0800
X-Gm-Features: AZwV_Qhkxzj_Y9cwaD4tSP0GMlfoxTMZyhjGCrw4ED-TcUztP4RUDmlAh8THzag
Message-ID: <CAH1PCMZAEwO4Vg=TdZ9SR1uwm3OOw_y79iCRC+E+SZiVRNtp+w@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: Add "b" ISA extension to existing devicetrees
To: Conor Dooley <conor@kernel.org>
Cc: Yixun Lan <dlan@gentoo.org>, Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor.dooley@microchip.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Junhui Liu <junhui.liu@pigmoral.tech>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 4:42=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Wed, Jan 14, 2026 at 10:33:34AM +0800, Guodong Xu wrote:
> > Hi, Conor, Yixun
> >
> > On Tue, Jan 13, 2026 at 3:53=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wro=
te:
> > >
> > > Hi Guodong,
> > >
> > >
> > > On 15:45 Tue 13 Jan     , Guodong Xu wrote:
> > > > "b" is ratified (Apr/2024) much later than its components zba/zbb/z=
bs
> > > > (Jun/2021). With "b" added into riscv/extensions.yaml, a dependency
> > > > checking rule is now enforced, which requires that when zba, zbb, a=
nd zbs
> > > > are all specified, "b" must be added as well. Failing to do this wi=
ll
> > > > cause dtbs_check schema check warnings.
> > > >
> > > > According to uabi.rst, as a single-letter extension, "b" should be =
added
> > > > after "c" in canonical order.
> > > >
> > > > Update existing devicetree files to conform to this rule. Line bala=
ncing
> > > > is performed where needed to improve readability.
> > > >
> > > > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > > > ---
> > > >  arch/riscv/boot/dts/anlogic/dr1v90.dtsi     |   5 +-
> > > >  arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi | 256 ++++++++++++++--=
------------
> > > >  arch/riscv/boot/dts/spacemit/k1.dtsi        |  32 ++--
> > > >  3 files changed, 147 insertions(+), 146 deletions(-)
> > > please have separated patch for different SoCs, so they can go via
> >
> > Understand your concern.
> >
> > > their own SoC tree.. thanks
> >
> > Conor, is it possible to take this as one patch instead?
> >
> > It fixes the same dtbs_check warnings from riscv/extensions.yaml across=
 three
> > SoCs. Keeping them together maintains readability and clear tracking, I=
MHO.
> >
> > Happy to split if needed, but wanted to check first.
>
> I'd rather you split it, sorry.

Sure, will do.
Thank you both.

BR
Guodong Xu
