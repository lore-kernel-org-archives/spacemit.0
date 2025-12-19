Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A03B1A2630
	for <spacemit@lists.linux.dev>; Fri, 19 Dec 2025 02:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766109819; cv=none; b=sEHh7pD3CL7uLiH+D1tgDc8eJCjKf2zq26idTMXj5yXwY+aNzP5SNXG/B/0QpNKMj0PXHqpkw4cUfOoc9cv2dn5l7MdAL+pB5ZimboS7gu0Gaay/dIleFKjKYExy1iy/RhCIugxEgJJZSAgpPViAJpYPM+PurNIGCe7+FvOrAH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766109819; c=relaxed/simple;
	bh=jn6QuPA++N1bgXfpVmlEfC+EqcNWQZM9P+L4OYC6cOw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BwR4APxMr8Nff9+zdZ59+1lPpxWP5mZlr5aIS+33azh0ZTBn06VEvBIhWdlrg3G5Z4VsloE4pO+1uEOhOM615Tbkyawv8xxGfKkZqJjIk7Dl6Ra8nYBtOk4FgKMDqVYXnws1O/nmceiglLKu9TXAQqwGuzclqp9UH18y0WQupWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=NieYsT4u; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="NieYsT4u"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-78d6a3c3b77so24159047b3.0
        for <spacemit@lists.linux.dev>; Thu, 18 Dec 2025 18:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766109815; x=1766714615; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4uRThTCFzR4PpfCdouHob+PVTUEweX/F6eTcDNk5cc=;
        b=NieYsT4u8Umqxwh1SkCzR9KS2QGStsrD3R/d5Nbsl+8w0EHCM6mUfqxC02dHgoODHu
         JqyAgh9Ib8CKjuGbECXhxgRq+10GO434ADLa9HdT9Fx1Z06zxE9zIU69xQbdoOk1udRn
         8J2NUocARdZYsnwoZBSJxGQc9VblcJmZRME7sO23W/z7kJEkBL9r1iaGx0oW00wEX6pY
         27mVUi2V/9lJUraDhg1sGNO4YnE6xevOi9k5EPDLvnWmj+5I+Sc2oTktXYRisPyZ1GfG
         VKTvko2ASIpIba72cxmZ3vOa8F6IUeRocniDBeT7DLqbTm1SJwVtE5bCZGXr0r/sjz2G
         odsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766109815; x=1766714615;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y4uRThTCFzR4PpfCdouHob+PVTUEweX/F6eTcDNk5cc=;
        b=GprRwZE6+zg0/mN+EHt/nY2JDuXL/WqqteDjcxYRRKhb4878E9mQxuUwgMYXI+3bn7
         3v1C8JyBtYvOvWbT8orvGa0YeSZ8XHAdgnYNAEaHFjSP55AEMh8ot0LQ+IrmH+TBvwAq
         azmM9zFyUtCe0B8ieyZ0XqydnuxpZNMMOoOzKno34gISLMElh3DWClEmB+WliqwEajZC
         HulHRxp/OCSEloQ5HKa6g6/ySO2YiSlkCNgKOTFFURf/gHmlccK7g6NmNTHP0+212cg7
         zbiLSU1Xel/4jGNxt8cBoY7PZ0cXrMYGlS7Q5BupsrTllD71qf2TJYbhiJph5eg7IYiQ
         AmoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMpDttuhkfjEORi1zCBOa3CmGG9R+l/eVhZ/DjHSiJelCDN9jRegKQzbWWc18NYTgU1hq8xPQ5Vw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyusZ+1vL5eNimfjhAqx24K+SD9wBElFKBq+VrsKomunxlz9+Mm
	dZENHGCV+bznodMDb5+G4uOLy0PEt1w6qGZQprzCNo1mV6FtxHIspOe5K+/taN/2N7wemFU4b1T
	VcdRnySqeNVOUDWZQfXnXeQ/C3MBFQffSOnJnKizTAQ==
X-Gm-Gg: AY/fxX5sc+G2ET8tdd9f9uvR1ikS/cI0ggxPdKU7eaFgEV15Lf/OUTZmw512blFO5Cd
	cv9u2JqxgWSf01+PB9SGAV/izacs1xfIOBhXJtRsbUcIj/nua2cS+NRh1cyk/Vxs1C3lKezhemr
	K7AoL/NejewiwnaqHotgya4PhuZAtBGq3eVCZWIT+UUJ96LCvUZJadqaeWOEEhSB038c2XN/qgl
	i0I7yPVAcXONwPDBI0j40IvqiV+7gRcRTx0LvbKLTkVe7UUG3M/oHwi2crTe7TNm4YYc2+8gp9k
	apvmZNJu6SNquc6w4uJbpbIQL0AGibWaaHM3slTWpdB2
X-Google-Smtp-Source: AGHT+IF3DTQjhYXxXW02+36G3FZkGzFfPUCBGdfYMLCgAD9oY3x9lyfyI9hU1jICZ90CgmmUFuzjagYwpgVNhEXch9g=
X-Received: by 2002:a05:690c:e3ed:b0:786:5d0a:c273 with SMTP id
 00721157ae682-78fa5b378bfmr42599997b3.23.1766109815187; Thu, 18 Dec 2025
 18:03:35 -0800 (PST)
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
In-Reply-To: <20251218-basil-quantum-225ce16e4699@spud>
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 19 Dec 2025 10:03:24 +0800
X-Gm-Features: AQt7F2pwbMDoA8a91avNmO8QE-jXZtj0DvWYaFdgnJLNRPa-LseO9ZnPDmTIGAk
Message-ID: <CAH1PCMZ3KM9-D3NJ1N2LUHTHFSDVKmGKT5fU8knAL7NnV9E-gw@mail.gmail.com>
Subject: Re: [PATCH 7/8] riscv: dts: spacemit: add initial device tree of
 SpacemiT K3 SoC
To: Conor Dooley <conor@kernel.org>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
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

Hi, Conor and Heinrich

On Thu, Dec 18, 2025 at 8:56=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Wed, Dec 17, 2025 at 09:07:14AM +0100, Heinrich Schuchardt wrote:
> > On 12/17/25 08:11, Guodong Xu wrote:
>
> > > Specifically, I must adhere to
> > > Documentation/devicetree/bindings/riscv/extensions.yaml (and cpus.yam=
l for
> > > properties like 'riscv,sv39' which stands for the extension Sv39). If=
 I
> > > add extension strings that are not yet defined in these schemas, such=
 as
> > > supm, running 'make dtbs_check W=3D3' fails with: 'supm' is not one o=
f
> > > ['i', 'm', 'a', ...], followed by "Unevaluated properties are not all=
owed."
> >
> > If Documentation/devicetree/bindings/riscv/extensions.yaml is incomplet=
e
> > with respect to ratified extensions, I guess the right approach is to a=
mend
> > it and not to curtail the CPU description.
>
> Absolutely. If the cpu supports something that is not documented, then
> please document it rather than omit from the devicetree.

Thanks for the review. May I clarify one thing? Both of you mentioned
document them, given the amount of missing extensions, is it acceptable if
I submit a prerequisite patch that only documents these strings in
riscv/extensions.yaml plus the necessary hwprobe export? Leaving the actual
usage of these extensions (named features) to the future patches.

To provide some context on why I ask: I've investigated the commits & lkml
history of RISC-V extensions since v6.5, and I summarized the current statu=
s
regarding the RVA23 profile here:
[1] status in v6.18 (inc. v6.19-rc1):
https://docularxu.github.io/rva23/linux-kernel-coverage.html
[2] support evolution since v6.5:
https://docularxu.github.io/rva23/rva23-kernel-support-evolution.html

Strictly describing the SpacemiT X100/K3 (or any core) as RVA23-compliant
requires adding these extensions that are currently missing from
the kernel bindings:
RVA23U64: Ziccif, Ziccamoa, Zicclsm, Za64rs
RVA23S64: Ss1p13, Ssccptr, Sstvecd, Sstvala, Sscounterenw, Ssu64xl,
          Sha, Shcounterenw, Shvstvala, Shtvala, Shvstvecd, Shvsatpa, Shgat=
pa
Plus 'Supm', 'Zic64b', 'Ssstateen', 'B' where the kernel supports them but
they are not literally documented in yaml.

Is this approach acceptable to you? If so, I will proceed with submitting t=
hem.

Thank you very much.

Best regards,
Guodong Xu
