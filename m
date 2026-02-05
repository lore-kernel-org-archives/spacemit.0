Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDDC2DB78A
	for <spacemit@lists.linux.dev>; Thu,  5 Feb 2026 03:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770263239; cv=pass; b=U4tk3i4UFU2qcOY1dPp4xQRbHvw5QXEl6ghRvko8fnpKcYy/DOzatBGuCVrHK/iy/rRgv8D8lVXeq+zcIRzSu2H97JU4UT2GQMytpAPuHvmQzTIhqA8K+pRug2E5vNdwWjePMepcK1cYmBru0J7CS0uNGfvZH36Y49Ye8BlSZEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770263239; c=relaxed/simple;
	bh=U1uxpilUx2DxGX0pxECF9QK743XJ04lwD+hGq3RgaM0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=smRxdmk8GRr7/AqJiEdLyMMxBaiZ037CJ9XqYRlZCHfJSWUcWtkzHI38xA2uKTmc2lkjrfbmmanEcthMM0MLeabdQBQ/KSO0Szx7cRSgLXNemzqEfYOJDVqGJmbbo91dpi8LUJ7BGr9DgGtwvVnU4spHGhUD4FUnDMplwLQ1x/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=OsLg/zV3; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="OsLg/zV3"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b8837152db5so73845666b.0
        for <spacemit@lists.linux.dev>; Wed, 04 Feb 2026 19:47:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770263238; cv=none;
        d=google.com; s=arc-20240605;
        b=hSBnMdCV6W2fdTpafSc2FUTy4Xq1z49KOi9gEg6Bu3gzeVhqGx8iQ8A+mvA2G0pqAU
         EMUWmSluNMvuIJdDWeO0MQp1SO7R0QL7xndtJj+kMsKanIZUbtUIC/fPVJMQ/KcpXMAU
         UNFrNynLt2HRVSlRWoeabOLn+JmPKZr6aZUTcIUwLKR5POLaZP0819d9e/Wpwk4psmBu
         b0ganCcc3XNCBxIM96VhSGCSNIbIxkVjl1mHmpbFnI7YR1uxszstylJDEB9vcDj6kAlP
         zgzvtLjRg2dJ8eJpmPBmjviCswNmtQUmb6Eb8Bsm9f5TdEgoXkJB3Q79gwsOfqmeAjgq
         9OrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bWzU3QUTkSaGp/URwdKcUANl9SeI3h8kqMKRyxrmMQw=;
        fh=RO9JtKm6otXUvjjdTXd0f94ugugW9yWjkdavgJPIWMU=;
        b=LzM3aequXAX2sH/8zZX8v4ziuLGeuHP0bTKoz56RK4z9SwiSlTIR/N3pYeOr11DMHX
         iQPVDPNwmE1PUGJgY3KBifTdU0DcaRU8TCTTpH20Zqok+0Zyts+g3WhwHp7kuSWKhu/v
         dAIQWDfL8mMYBkr8ISn1jMAn/bAZAbOBLUSDlMF82AOfHWvAxzYYsZl6nW5y8o2oAwgj
         d+38nyjupI+1kd8XZT/H+OnSZO3R1Hfj+MkWxIPxwSoYwXL8W+3gZlLuWrVqpRSzdgHb
         RWJwNN9nwaR6mxE/2psULROMHJYPgJqqXjzgvBBNnnr9kGfJZkSKwff+qDIFyTvabju2
         6tRA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1770263238; x=1770868038; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWzU3QUTkSaGp/URwdKcUANl9SeI3h8kqMKRyxrmMQw=;
        b=OsLg/zV3CH/rvMQkRUuhyUZ7q42xWK8ll7Qwb9P3ieb1H94tj8zzCZfy7GMJm2Mnkk
         i5c/EvxNS/iuTEHfe1rw7drlNtVwZCmaZw92BaVka0LqMFZIKb+vFTU5u9txDymFiwkZ
         Yx/S8L9AMkzS1bx47ZflXGukylcH5g/XQBoV7Qnn/4DOHXhyfuxhoELFZPCT2Fj6sE2Y
         LVLyxzVpEzfv1FLP8mb1C2QzVEfof4iX2jal9vm0phuBhm/TJyUNluLnRd4tEPlLDLxL
         nQiDeyZcoxiagGvKVdxs1g8jLsNjSGdjUkidOntZBbE53G0hEOx9JTAxv5l4VGr3Ir8G
         Qdhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770263238; x=1770868038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bWzU3QUTkSaGp/URwdKcUANl9SeI3h8kqMKRyxrmMQw=;
        b=HngnJOK/9jRzKtt/WjGODfTQD0rIAkNUk1vR95HpDOnjM3ahW5W5vUYrpN9umI5oek
         M10MyvK6FRs24dizEnqT1x05c2bO3E6luYtOjDd8E09HlLbP4sNG+U10xD7s89/fJ9No
         AHQJhzhZ7Xo7BQ6c9hgeoWewzVJxNXqCarz1p7E2Fpd9f0NQoZ0mDUwLaAfF3HrFOQZ8
         idu2HVe5MD2ifIl8DdWvk74pMRjLzqk0gtVRO4POt8gssuh3/TDRZvJDhEJX6oMDpL0R
         E0KqMu9AuFaCdPTd2vlU3gShEswlYLoiDNIMj7C3cWkvvBWH9pYAAUbNCuukxTfkYHlt
         eSfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVr4ebsQoHn7SOwDkLO2/xpqDSYYoGFctGG1JRVdK28CgYTXSBwpk/v9OCKgW/89248++0FYcn3qg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyOJfcb0djuOXw4tPR4NBE8LklYiwikzXzLB/w4aL8vUduml592
	7apwdfgqkB+pkX5gy29fIjndK2m2PzL2Idvktt3YbebT2G0nZZUeodHv4PMToaBHH2qhkzcPZ+m
	1mOx2Odv/yVeUdnWEoT9wmE9x7ko8syTNeK28zi9UZw==
X-Gm-Gg: AZuq6aKGpLNVERoRsW6Apj50GWdqB+tXXYDM/NnROl8Bcmeq5glbRRqodsDbXRX5FRy
	RNJHL577zpZhe7jc7wO7EAVuIfPXmTQSI1uxd8lDlZJig4s2ITfbEYuNM6eN49T7d/PcSbZgCl9
	looBcog62oYhEhyp+619Odv+bo8XXOw8owqEWOg3ivb10uPOX7xqXae0TIijrezpE/CNXJi0uOW
	+AjwGJHoo9jsfi0odVT/ROIm6D6oGR++W0dyyR3XRKNkTRIMjP0CtQoGuuxFxippaW9VHIUlxL8
	L2Go+rgS
X-Received: by 2002:a17:907:9409:b0:b8e:8874:8384 with SMTP id
 a640c23a62f3a-b8e9ef30487mr317378866b.4.1770263237571; Wed, 04 Feb 2026
 19:47:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1769562575.git.lv.zheng@spacemit.com> <cover.1770195980.git.lv.zheng@linux.spacemit.com>
 <9C0A2AD4850D179B+524146e74e808db90d5f28fcb6ee791cf1d1bfaa.1770195980.git.lv.zheng@linux.spacemit.com>
 <p74snip7yykhogvzqld4gyjlygmd2z4kqnat7w3qj63fwebnmm@dlz6tloevgbs> <4D87481E9AABE2C6+72d18f72-9407-4d68-8195-edc6c171df14@linux.spacemit.com>
In-Reply-To: <4D87481E9AABE2C6+72d18f72-9407-4d68-8195-edc6c171df14@linux.spacemit.com>
From: Zong Li <zong.li@sifive.com>
Date: Thu, 5 Feb 2026 11:47:07 +0800
X-Gm-Features: AZwV_Qj4QZXbWJXyq8Jiiv-VQvhct2TUKL3kLYYPr0oB9fDJjewtTcIansChXl4
Message-ID: <CANXhq0q8N5eHx9ytabZR97Y7AULKwgS2-uEGhcaOOGp9mvbtRQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] iommu/riscv: Add HPM support for performance monitoring
To: Lv Zheng <lv.zheng@linux.spacemit.com>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>, Tomasz Jeznach <tjeznach@rivosinc.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Jingyu Li <joey.li@spacemit.com>, iommu@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 5, 2026 at 11:35=E2=80=AFAM Lv Zheng <lv.zheng@linux.spacemit.c=
om> wrote:
>
> On 2/5/2026 2:39 AM, Andrew Jones wrote:
> > How does this relate to
> >
> > https://lore.kernel.org/all/20250115030306.29735-1-zong.li@sifive.com/
> >
> >  From a quick skim it looks like there's plenty of overlap.
>
> We developed the driver in 2024 and demonstrated it in China summit. We
> didn't notice that a patch is on-going now in the community.
>
> Now it looks our approach solved more issues, and we'll check and update
> if there are any community concerns still not addressed in this patchset.
>
> We can add Reviewed-by/Tested-by and Signed-off-by of Zong Li to this
> patch if he wishes.
>
> Thanks,
> Lv
>

Perhaps I can first post my next revision to the mailing list (hope it
won't waste the community resource), so that you could have a chance
to review it and see whether that version is architecturally closer to
what the community is looking for, while also addressing your issue.
If you also feel that my next revision meets your needs, perhaps you
could append your additional implementations on top of it.

Of course, if the community would prefer to go your version, I=E2=80=99m
perfectly fine with that as well.

> >
> > Thanks,
> > drew
> >
> >
> > On Wed, Feb 04, 2026 at 05:09:01PM +0800, Lv Zheng wrote:
> >> From: Jingyu Li <joey.li@spacemit.com>
> >>
> >> Introduces perf-based HPM driver for RISC-V IOMMU, enabling performanc=
e
> >> monitoring capabilities.
> >>
> >> Note that the RISC-V IOMMU HPM module uses COUNTER_MAX-1 as a static
> >> counter index of HPMCYCLES, and 0~COUNTER_MAX-2 as the dynamic counter
> >> indexes of other HPMEVENTS in order to correctly index into IOHPMEVT a=
nd
> >> IOHPMCTR registers that have already been defined in the iommu-bits.h.
> >> However the users treat 0 as the index of HPMCYCLES and 1~COUNTER_MAX-=
1 as
> >> the indexes of other HPMEVENTS, thus care should be taken in dealing w=
ith
> >> counter indexes between userspace and kernel space.
> >>
> >> Signed-off-by: Jingyu Li <joey.li@spacemit.com>
> >> Signed-off-by: Lv Zheng <lv.zheng@linux.spacemit.com>
> >> Link: https://github.com/riscv-non-isa/riscv-iommu
> >> ---
> >>   drivers/iommu/riscv/Kconfig          |   9 +
> >>   drivers/iommu/riscv/Makefile         |   1 +
> >>   drivers/iommu/riscv/iommu-bits.h     |   6 +
> >>   drivers/iommu/riscv/iommu-hpm.c      | 843 +++++++++++++++++++++++++=
++
> >>   drivers/iommu/riscv/iommu-pci.c      |  13 +-
> >>   drivers/iommu/riscv/iommu-platform.c |   8 +-
> >>   drivers/iommu/riscv/iommu.h          |  42 ++
> >>   7 files changed, 919 insertions(+), 3 deletions(-)
> >>   create mode 100644 drivers/iommu/riscv/iommu-hpm.c
> >>
> >
>
