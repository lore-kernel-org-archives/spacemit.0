Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B74A30FF10
	for <spacemit@lists.linux.dev>; Wed, 31 Dec 2025 07:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767167897; cv=none; b=fgwCwrR1oNd9QdmSrl0Ec05s8yBBgtjGf7ak5/tZwrPCRSYplkkPCG1PscCcC/hw/KnRj9PXm/W61BhjnIKplatuzYGDeuYIzZeB0Myq5QeeOQUJ59ZfimR0IS0f1/HFXweAwqJuippmE93+0M/eBlIwiG+3m9yCbVFhSozCS1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767167897; c=relaxed/simple;
	bh=KTe+uww2iCrHymaii5h3grRGLClKo9EOT5Ashcba0hE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jeWN6tdmU3ctv2SFOweTkMjJnVNwDayYVLDsZ4F+0VQt2X1iTx2irtetebJbXhuCRgArQhJakD/LkHVK1kvkwC51Q4wAAUS8aZu4lxRBSHlfgeUe16a8K87HHwEfs0i2Z/0PjkFRouEGZKEVVj77JGYVE6FlZ+U84qOiaWJdauo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=MDN0BcHw; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="MDN0BcHw"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6420c08f886so12865209d50.3
        for <spacemit@lists.linux.dev>; Tue, 30 Dec 2025 23:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767167894; x=1767772694; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KTe+uww2iCrHymaii5h3grRGLClKo9EOT5Ashcba0hE=;
        b=MDN0BcHwVKvjAGXhK1IBRHxSJ+a01wQRbw2lsiCyCScypR8PfQ/B/3Q4bLaxrpBYwZ
         n9XLnmVc2rMhJp+G28c1Zn3KMPVxu/dknUz0NNGTDCAYI/sRHMzyO81TgJ0QN8wr0a4q
         7+b8kT3poi4Be3GYFX1WSWgAD09HM2MbtxbjebfH9Byx4yRoKk24p1M3y0gueroBjDRm
         wv08u/1FNjHd0nLsuAIdfaWYldghxN1Ir6N/57xSyom0iwG9bjKYg+SROatmrTTSVofs
         cXP2hS0AxtFDSOQRBLXc8Fjjs2g8e/SyBZFiW2wxNjzeM/l0dKpmJEAOlRdYuIAfdo9b
         U1Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767167894; x=1767772694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KTe+uww2iCrHymaii5h3grRGLClKo9EOT5Ashcba0hE=;
        b=dHpqWAvLs3ET0GRhhGt7EFU0Q1kCkGC0c6dqV5U0yK2KhNG675NtWWUydXQ3IZuaOT
         Hr/BopPc+4aYLeb8JRqBgLTRlE8dHqzoKxU6yBoMdXRu3lpfOesaDMEuU9lwd4Fe67tb
         bWRj30eRE96Qf6ImAk54bSfFiHJcQFoq3nF4hlavGW4c5cQlI+8xVxlmluBxurUyc9Jy
         tGm6FA21USpFFizvekiFTE6fygGu6eJnwW/XAAHSu+feYf726XMedSBevrGLnhv72Pnn
         HpG4Nx3VZ7i2PzwuDWduqr4X4Gk7xLjAElm6YSaE7OqHCixb7GGeGFAFRU/LAFFx6fKM
         EpBw==
X-Forwarded-Encrypted: i=1; AJvYcCWC9uU0pmio1S9Zfwn0l1vBFQ0bZ0IEmRZ2rH/260m9sZbE3HSUOztMu1vjOOovlVjB8i+H3HmSUQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxshKCbaxNpP2weSYchld51DyqKER+7yQV4Yfsr/gkwB9O/plpb
	8LbOiKtUXMaHy3l2XvzveeeICKxxnwNWXVH82V218NA3b4oK/ruDK33aLbvwoXJ8lRk1EaGNxs4
	f+AvktAg2a/5zVfqrayB/fEU/HchHMKEsCJY5XvHDbw==
X-Gm-Gg: AY/fxX6NSLX926b1hLI4vVgHbYigxa5qBDI3768kPjPrlhSEaykwRt6TK/jli7NM90T
	oZmR4xSFPop+sQNfPuADWx13plMm4Sb0IyOKe7gnxxZOuKimHMqHFpvWn3Hj+qzvYgO5vaIN4e4
	qyoS//8cGhNKvtmNpOTUp/auYl5nDmOEX0xepv9ffTGSpZX4Vghfktcx7fvU/Pnv4JMS9l4HrxY
	OEdsrczY7Z/Dlggv0IGcJuHbZk8n6VVG4d3tpULfcMvOlGYe1QLpqX2WacCLPs9R7B5qvcQJI6L
	l2T4uUyK1ViZxT2cb9kXS2zaa47AWozqm9dHxQU7oSE8
X-Google-Smtp-Source: AGHT+IH53FvUpz0dR04OFmctNYeppfU38AmPI7x8yHnkIoO7J4A8mQkJ+AGynPvCIOVfnVQmo938afWT4z4sYjqeQLk=
X-Received: by 2002:a53:b98b:0:b0:63f:ce86:8b81 with SMTP id
 956f58d0204a3-6466a8445c0mr23299917d50.18.1767167894213; Tue, 30 Dec 2025
 23:58:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251229-k3-reset-v1-0-eda0747bded3@riscstar.com>
 <20251229-k3-reset-v1-1-eda0747bded3@riscstar.com> <20251230-charming-nonchalant-goat-98bbde@quoll>
 <6ed0436e-e03b-4b17-a70b-6f848f14e1d8@kernel.org>
In-Reply-To: <6ed0436e-e03b-4b17-a70b-6f848f14e1d8@kernel.org>
From: Guodong Xu <guodong@riscstar.com>
Date: Wed, 31 Dec 2025 15:58:03 +0800
X-Gm-Features: AQt7F2qzhgUj-QKv44VxiXKT9CGYXUenv1CyhrZqOLWPCsSao1lPbDdY4t_Ch_U
Message-ID: <CAH1PCMbKwBUJoVfL-wqsd_5RWNVFVVC_UPxk2B3VFeRkDertng@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: reset: spacemit: Add K3 reset IDs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Alex Elder <elder@riscstar.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Krzysztof

On Tue, Dec 30, 2025 at 8:24=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 30/12/2025 13:21, Krzysztof Kozlowski wrote:
> > On Mon, Dec 29, 2025 at 07:04:04PM +0800, Guodong Xu wrote:
> >> Add reset IDs for SpacemiT K3 SoC.
> >
> > Why? Where is the actual binding? You have entire commit msg to explain
> > that, instead of duplicating subject.
>
> ... also because then I would ask what is the compatible and why the
> filename does not match the compatible.
>

Thank you for the review.

I see your point now. It's my mistake not explaining the relationship
between K3 reset and clock controller. I will update the commit message
in v2.

K3 reset devices are registered at run time as auxiliary devices by the
k3 ccu driver. This way, they don't have their own yaml binding file, but
reuse the K3 ccu binding, which is built on top of k1 syscon:
Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml

>
> ... also because then I would ask what is the compatible and why the
> filename does not match the compatible.

For the filename, since it lists the index values for reset data, I
chose to put it into include/dt-bindings/reset/spacemit,k3-resets.h,
which mirrors the clock part at include/dt-bindings/clock/spacemit,k3-clock=
s.h.

I will update the yaml file (spacemit,k1-syscon.yaml) in the v2 version
to document K3 reset support and include the reset header in the
description, so people can clearly link 'spacemit,k3-resets.h' with the
binding compatible.

> >
> > I am pretty sure I already asked this for a different patchset from
> > you...

I apologize for that. I will be more careful in future submissions.

Best regards,
Guodong


> >
> >
> >>
> Best regards,
> Krzysztof
