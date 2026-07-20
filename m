Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A04432E7D
	for <spacemit@lists.linux.dev>; Mon, 20 Jul 2026 14:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784559257; cv=pass; b=gLuICc8D2HqNJHJZ+Kt4lMF4/a8eJiAOpvsTGTySPW23S+TZA+OTbCnnXUZjAYBL3BOuGBWbytvIuq0xtrL5tXv39TatJxN2tJUkdMbIhEZLrpQHVZsVmDr14rJp6ls8umMNEiulVd+J0tx+6yR+rNJ7MufMPNTuw4S+i9IIhqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784559257; c=relaxed/simple;
	bh=temBpWxqPmEUiaCW+JFviLYqWJ/cLM5Aq3hOWyylZNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ke8+CQJ3vYV6ntey6uiZSdbCh4T9fmM1/FcnvyU0Jodwnd7TD/ul0S/MXMFPc7Kv282mwbXeoBMc1VyI9OuzCRvwRXlCHgj02XyfBaka2eNgTN9MKVhVuMkz8DtNEe2O/eTdmaUK2ITUrtO+CrqFaOtlhreNj3EBDtczze1bmzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=KhxKINaJ; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="KhxKINaJ"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-664ce3000e6so5581242d50.0
        for <spacemit@lists.linux.dev>; Mon, 20 Jul 2026 07:54:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784559255; cv=none;
        d=google.com; s=arc-20260327;
        b=MVKp9irxJMD4SxPZco7rHOt3im4pJIafltM5YptI7SgwqmnhXKbekDSE1C9LQKQIMO
         X/qzzFCuxfF/+1e1R88upBuJpaG5im0UYE9gk/Bzqspj3TvM5nhqh7kLuK2QUHTuqB7W
         PuEFpG0EVflWj8Igozb8/juHyxs9B+U+8xnioVqYhKjXZH3TnZd2iD7+ToYD3aEYSmy4
         5xNI5Vk5HetG1mwDfdDdLjtowgbO3BmR5lq8HHlRaBs/i185utymknr/mzB2wR/QfnUh
         KdRDwcMo1jdUgMLChCA+Udt7nlUqeHhqG6O0Gat1t9ehpgd3u5meIwLy2qieIbkX2/y6
         3KIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I0GVcV6hLmc+NX2bk98Kn3FEQV44lshItim/tETy764=;
        fh=fg4KyR05Cypx0WE0JePNoBzCLX51769anex0eKCSatA=;
        b=nUsIijdvYS7cqE1itV8iyBhba1UhiNOjwMnf6E8BEJ4x5XhHUnPSazGJm8Giw5mGTW
         M+WhX9J5mOTPYf50YsaHcq9nqhOliJ1ZSssvmpXhlYn36jIh/vQvegzct42yhVt1w87Z
         jj5Iz7atU029J1W5fTPav8uf4UULAaZAzH4SNObMuuSaPDpfaWZZ6AgXrti/ymH8qY5A
         r/VTFauFL5MjetxBIZBHT5kMrLNmTkC/J0KzprNha2fRHWw8XvGXZQn9t5JOyNfaIZeA
         Q+eP1rYZZbsSpwBaOdEbyMji16YQRsPxkl1c4cUl3Mda/4CzEHIQSHKjmXVvb3WbLA14
         JzaA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784559255; x=1785164055; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I0GVcV6hLmc+NX2bk98Kn3FEQV44lshItim/tETy764=;
        b=KhxKINaJJcm0j1F+NJQ4nQFO0EaHgitDPA5Zo7wxN9iQeMs3XgKxh6MZC6jrxiar+B
         mkXt0GwQaA8jVyeP2vgC+8fQinRb7ePgbY1W9qKme40J7WdNgnrpUy+KLTaNmYQlrIxt
         mJbdjxweBJkTYQ9+6m3S/bMhY8fc72itK7dOTye5Fu9P+zXBl+CRoayfPCxVaDK5EJ0q
         9qdqzDI3I+0i69hGULhZ6n8k0WJIdUBkhLWUp5ghv4xqGXg92oveOJJ2141CGtK+rgHB
         oNEDdriVsxlPH2Nuod8Jfchp573FusP2J3QaAEzXbZlkfbvsNTxRXy/npoVYRZhD4SSS
         k/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784559255; x=1785164055;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I0GVcV6hLmc+NX2bk98Kn3FEQV44lshItim/tETy764=;
        b=VdLVkpWhHrTRYzIak+HbX1iHyB35Jgso5D8MfqFcaw01hKrUIJPG0jRan92BgKkLYG
         V95ZLO7tI6N3CEYnupXmzQJK7kMTz2j+RhVl4Ygcahvg/xoCnj4W9j+6biBvOjv9N7ME
         3NgUDC7V4FPZzS6+8/H9/OUCXfuxbuBw8vogpG1kf9smT8fSymI8gzjiopabmOw3rBD+
         dg2/sFtyuIxsKSev00PtGrJmuzKiyyG2zEjQEaFPE2yKbNi1bXuGDVUTp0MdjECC3LgE
         JusqI73oOndheyN4guEExLMyW/6X5SOKToj+Q9hNqAMNBrk8+7sl0+FFc/kzUUObOVwu
         gxeg==
X-Forwarded-Encrypted: i=1; AHgh+RrCNXtpPbqAflH3rnZcNcyA4kAslzKLJORDioz0P2Y4DBoFxbFPqeSfUZFkeetXfKavmdgrrsTXaQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwfWZpU+WntEbnHw7r9KnIoTqwrxLkhy/mCTMpwbtQV1+t/RQxC
	mfazPcCRHa5GHijG8Bb3QiKidWewdS+YHQvnk1lCENNlBDqz/2ZqaiSlvk9uhpXxNoqsI1p8pJM
	URqVH3ISZhqAUHY3TMA2T4oRc3szvijsuaTCinL7Shg==
X-Gm-Gg: AR+sD106tObczuSrTch50JvMJ185MMwib0i/vVJSAoR29QDOw/Osxe18Q1R9RnqHscy
	WDCoe8lfxaMt4Y2o5Mx1sbBTogglgHNjNB0GFOvlAINdecFFuLh0LtRgK+tX6I+Em38DGPf9eXf
	Z4hV7RxIh1mngMWcp1aI93lp/98tcaikcD3cRx/PU4xNWIIkuO2n0biPeq7YyUZRMTEgxWN0isS
	ABltoDXem7rR11idSseyeVG91WxpskhSw8ByKYLF5+g38KGtu48I4SYv4ehH7ecG5DrRfqqlbrc
	f33rjbJB6ZxyPiJg
X-Received: by 2002:a05:690e:4105:b0:668:7014:4ca with SMTP id
 956f58d0204a3-66870140b44mr796774d50.58.1784559254891; Mon, 20 Jul 2026
 07:54:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260429-fix-riscv-swiotlb-v2-1-fa99dfdfc94d@linux.dev>
 <k55h7j5qnn3dryqro2oof7kgjcdhyoarvg7uvtm6sbrgdtnfzy@br6areeqp4ng> <57a24fb1-1ca6-3bb5-1c1e-bdcb50ce2b7e@kernel.org>
In-Reply-To: <57a24fb1-1ca6-3bb5-1c1e-bdcb50ce2b7e@kernel.org>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Mon, 20 Jul 2026 09:54:03 -0500
X-Gm-Features: AUfX_myMpZ4WtjKhLTFNevvbFR59U6AEJ6ipYVurDAp_Rw5Z-rFxfTZK12VSyqc
Message-ID: <CAEev2e_odw-Rcz1dKQq7oNDN6sex0cnVgdYtR=NZkKoo57p7Mg@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: mm: fix SWIOTLB initialization for systems with
 DRAM above 4GB
To: Paul Walmsley <pjw@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Sun, Jul 19, 2026 at 7:55=E2=80=AFPM Paul Walmsley <pjw@kernel.org> wrot=
e:
>
> Hi Troy, Anirudh,
>
> a few questions -
>
> On Tue, 14 Jul 2026, Anirudh Srinivasan wrote:
>
> > On Wed, Apr 29, 2026 at 07:41:54PM +0800, Troy Mitchell wrote:
> > > On RISC-V platforms where the entire physical memory (DRAM) resides
> > > above the 32-bit address space (i.e., above dma32_phys_limit), the
> > > current SWIOTLB initialization logic fails.
>
> Is this primarily for the SpacemiT K3?  Or are there other
> platforms that this fixes?

Blackhole has this similar issue with no DMA32 ranges. This fix
applies to that too.

>
> > > This patch addresses two interconnected issues on such platforms:
> > >
> > > 1. Incorrect 32-bit DMA bounce assumption:
> > > The existing condition `max_pfn > PFN_DOWN(dma32_phys_limit)` assumes
> > > that a 32-bit DMA bounce buffer is required simply because the maximu=
m
> > > PFN exceeds the 32-bit limit. However, if all DRAM starts above 4GB,
> > > no memory exists below the limit to satisfy this allocation. Fix
> > > this by adding a check to ensure `memblock_start_of_DRAM()` is actual=
ly
> > > below the 32-bit limit before enforcing 32-bit SWIOTLB.
> > >
> > > 2. kmalloc() bounce buffer allocation failure on non-coherent systems=
:
> > > For non-coherent hardware, a bounce buffer is still mandatory for
> > > cache-line-aligned kmalloc(), even if 32-bit DMA bouncing is skipped.
>
> I'm not sure I'm parsing this correctly.  Shouldn't this read "for
> *non*-cache-aligned kmalloc()" ?  Or am I missing the point?
>
>
> - Paul
