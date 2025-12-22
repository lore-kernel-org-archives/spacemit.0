Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABE330E821
	for <spacemit@lists.linux.dev>; Mon, 22 Dec 2025 09:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766395639; cv=none; b=ZfQUiJiztUcOLylEqOxxJMkoFhpwf1geEWsT/WlvwYhPSEbP4tdjQU/gnQmb2TdrpbuSKLEUqtALi7Nu5KxgQ4ILOZ2bUTDreZOCq2Ig08IRh7S2LJoc9AgRaxR9gF2w1iGioK/wAglgsWiYaOJite/VdAC1TLNZgOxGFtJWjX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766395639; c=relaxed/simple;
	bh=f3aAd8TRGvgzszWxZ6Ud1mmv3jorF91PLX3uVFKYvuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pI2zr1BBa6q19s+T/vswWwYpXeKoGka6IuL/KaoWYmk2auWVyknv3ydK+PDonmSmOL/HYKwoVzCLBYR8MUnCD/IqnlDiZ3YE4kAPC12vO03rCD/CIMxlhBjWB2JxgCXrwBPUuxWRxD99+nGYP5BdEe6gbctZ0e1vKwV8yO34cXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=hziEI3jH; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="hziEI3jH"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-787eb2d8663so45682797b3.0
        for <spacemit@lists.linux.dev>; Mon, 22 Dec 2025 01:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766395636; x=1767000436; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X9JR9FWj1NW5H0iyl0VHxuC1HgCMCwXIwoDdNUbZEwk=;
        b=hziEI3jHCHrNUXXNWbo0PsOIr/edPwevtwB2U8/FoIUy7DuLxZsWi6arqbhu9wDBOo
         P7ozVToqv/GvpRK7dmXuKVt9ZfSQNtGkT/vNAxlWrkAJ0vsQwulXWbK8M/umTNxMzTfp
         LV1WQQKrG69Q2niubztq7yeYh7CvP8KmbJW/NzUx2xMROsOKl897gyOuNHFQrcJuFpuk
         8h8WDIogI205kXbbR30G9Xx19/H/N2f0wVHGCERy70xN24S1TCc5MS2WS8htqr/vhZhI
         ToLqhUOEZi3vBiwXUT9wkPlMjwjKZUVHR4beEH40RGyCNgAHFdqayKS5ZsEUj2IQD0s5
         Pjlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766395636; x=1767000436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X9JR9FWj1NW5H0iyl0VHxuC1HgCMCwXIwoDdNUbZEwk=;
        b=TM2K/UEmTyERX5z7XwdOUBEFUn/GRdL8jTKtKoGhCWQzKu1Yz0dU+aXUmmngxs4hV/
         cqzNlu8ayxkSET8oK9ZvwSRoLe7LPwoIdDdIfBzLAa55a1fXH8fBezNEljzEr+bnMoL3
         M+WVBYMSLtgO+/NHQFf1UcQKuRDY61c7JmYvxN/moaNkk36wBaw0fMCiuaAE0GQv6L1W
         qnZsaGbDGSoCeVgKz/mOBSauat3cDk0q1kOr5dwUbTQNe1GGjGVfjIrnUuMfNcig+qX5
         hzrri984JKITFVyHvPw8XkkUU9kJ3hgFjJgHq+S/abarBgijxpvSr0szGx2GmBhjyhwM
         R5vw==
X-Forwarded-Encrypted: i=1; AJvYcCUae8GqV/cWL8T/WbcPVRPD65D/+QEl4jcba/MhQBoGv/q6iYTbckoYXa6E3H68d+3ZafSrigrDdA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw82RQYA8yCGz1BAPAXux78dDqSJ/iwsJWg6A53sk+2aNQwf98m
	ZuYJN4vh4FhWjJdqGg41nMNocZ5tx0mVRxS3cczrm0/9sqi7fMFwXnyqQtnPUCQ9xjMVXraJzQS
	4kfWGjT9LeR9OzhYdKNPcsNWwXnfDpWywJ98+KHJm7A==
X-Gm-Gg: AY/fxX6vjFcpjs2mppPF6gfP7mXDrtpDqaTRzkmozyukq+AtXaoL9yLVIKuPl3vwFLG
	qKeAeRu//Xzhkihlmr6/SwFjI8E26Nk0pUfF8IvBieU9BzkIuCzn833/5JFs98Kk3YRy3Hp3LJe
	Uk3QDjxXWLH9SxuHROWTBiebv0L7B9TiIJtyjqnRzsg4eAgmZKJj6JPPucBX0jTS/kgiqXYhZoq
	/flf1S83VyHLGUH/IT1zMm8Ony6j5Apft2fusqAJ+0BKr4RTG87+pgO+buAN7GLTAW4F1MRxNxL
	vtZzA9BFY25FKXnENZFSmxqfj4BNMGltnYRq8Q7mwPly
X-Google-Smtp-Source: AGHT+IEopdaH4VEXup08bA/QV1AhBuiIpBK4mPcZpQfYrRFDnvPhOVpgLeIitUz/0ef9xzGYyIV1deEuXbqK8/M1Otw=
X-Received: by 2002:a53:d056:0:10b0:645:527b:bc25 with SMTP id
 956f58d0204a3-646632e04d3mr8907715d50.43.1766395636333; Mon, 22 Dec 2025
 01:27:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
 <20251216-k3-basic-dt-v1-7-a0d256c9dc92@riscstar.com> <60948ca2-ed3d-485b-9b11-15df7ef8791d@canonical.com>
 <CAH1PCMb=+TvB1w+G6a2ANDp05HUwC4r6CFBDHXFwSmoP3Mm8xw@mail.gmail.com>
 <f9b6b5e2-ec9e-4208-8267-77020e0a9411@canonical.com> <20251218-basil-quantum-225ce16e4699@spud>
 <CAH1PCMZ3KM9-D3NJ1N2LUHTHFSDVKmGKT5fU8knAL7NnV9E-gw@mail.gmail.com> <aUYOgl8ffcJ0Xfwg@pie>
In-Reply-To: <aUYOgl8ffcJ0Xfwg@pie>
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 22 Dec 2025 17:27:04 +0800
X-Gm-Features: AQt7F2rD9S1VFl45xvpftmdWgFdR_R_Ul403nTlRAGDTs5jIW1Osdpar_Os9kF0
Message-ID: <CAH1PCMb7aUNt7VnYiZF=_V4nVziM-A0JpAqmU26ezwgk36=kKQ@mail.gmail.com>
Subject: Re: [PATCH 7/8] riscv: dts: spacemit: add initial device tree of
 SpacemiT K3 SoC
To: Yao Zi <me@ziyao.cc>
Cc: Conor Dooley <conor@kernel.org>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>, 
	Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	spacemit@lists.linux.dev, linux-serial@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Yangyu Chen <cyy@cyyself.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 20, 2025 at 10:48=E2=80=AFAM Yao Zi <me@ziyao.cc> wrote:
>
> On Fri, Dec 19, 2025 at 10:03:24AM +0800, Guodong Xu wrote:
> > Hi, Conor and Heinrich
> >
> > On Thu, Dec 18, 2025 at 8:56=E2=80=AFAM Conor Dooley <conor@kernel.org>=
 wrote:
> > >
> > > On Wed, Dec 17, 2025 at 09:07:14AM +0100, Heinrich Schuchardt wrote:
> > > > On 12/17/25 08:11, Guodong Xu wrote:
> > >
> > > > > Specifically, I must adhere to
> > > > > Documentation/devicetree/bindings/riscv/extensions.yaml (and cpus=
.yaml for
> > > > > properties like 'riscv,sv39' which stands for the extension Sv39)=
. If I
> > > > > add extension strings that are not yet defined in these schemas, =
such as
> > > > > supm, running 'make dtbs_check W=3D3' fails with: 'supm' is not o=
ne of
> > > > > ['i', 'm', 'a', ...], followed by "Unevaluated properties are not=
 allowed."
> > > >
> > > > If Documentation/devicetree/bindings/riscv/extensions.yaml is incom=
plete
> > > > with respect to ratified extensions, I guess the right approach is =
to amend
> > > > it and not to curtail the CPU description.
> > >
> > > Absolutely. If the cpu supports something that is not documented, the=
n
> > > please document it rather than omit from the devicetree.
> >
>
> ...
>
> > Strictly describing the SpacemiT X100/K3 (or any core) as RVA23-complia=
nt
> > requires adding these extensions that are currently missing from
> > the kernel bindings:
> > RVA23U64: Ziccif, Ziccamoa, Zicclsm, Za64rs
> > RVA23S64: Ss1p13, Ssccptr, Sstvecd, Sstvala, Sscounterenw, Ssu64xl,
> >           Sha, Shcounterenw, Shvstvala, Shtvala, Shvstvecd, Shvsatpa, S=
hgatpa
> > Plus 'Supm', 'Zic64b', 'Ssstateen', 'B' where the kernel supports them =
but
>
> Please note B is just the abbreviation of "zba", "zbb", and "zbs", all
> of them have been documented in extensions.yaml.
>

Yes, Yao Zi. I'll include 'B' in my next version, and add the schema check.
Thanks.

BR,
Guodong Xu

> > they are not literally documented in yaml.
> >
> > Is this approach acceptable to you? If so, I will proceed with submitti=
ng them.
> >
> > Thank you very much.
> >
> > Best regards,
> > Guodong Xu
> >
>
> Regards,
> Yao Zi
