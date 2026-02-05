Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3341326738C
	for <spacemit@lists.linux.dev>; Thu,  5 Feb 2026 02:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770257498; cv=pass; b=gF20WJPmPrsu7dkZLPmaCIjwy+cBZlrM22hzn9vqmGoigEL4E3Z62CFxqXUTk532uY36Yclk4GAvm8mz+rjahKNv92PavYa3JFxIGYM3zaWPlZa/azhh8rywgyujSQwkbQdjxxx4ZpIoRKVu4d9J4uFNll/4d0ym1gDQrfGHrfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770257498; c=relaxed/simple;
	bh=LzenXCyNDGAV2/s4Mt5xg7gtxO2w2kJ2SKaLgFjq5Hg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ll5t7LvnB2UjvIZK1+bFxaO6ncfo6rw9Wo/EM7Vr7DzBJ4nOTrbtiHshDppVitcDUysssAuWiVVDv6LJ54s2CEMuuN+k+dzHwz8hfbGHlNh1fpwbe3uGnuuXYbQMqP/XgXKGiC8cqA3NLrHHgN+MXg5Dsxm8DMHxnVtshqeS/UQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=XdnAF2xN; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="XdnAF2xN"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b8871718b05so63951266b.2
        for <spacemit@lists.linux.dev>; Wed, 04 Feb 2026 18:11:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770257496; cv=none;
        d=google.com; s=arc-20240605;
        b=Aj1t7yAdwe7MbADJEHSwctUjjZhNfikSu3LcL846tP73A87p9+NqbPsMzx3uW9Kwk9
         foF7QqGCIKL1RsEqSvsPsxtbHvNteajmE+m3WiQENc+vH3/OiWDKs8yELJU3FVay1vI6
         IMu9mnUsbFF0+HkprJCS/44j/7Coa11ibrQUMWoSANk4t3rwtvQjS4x0paEF+wUSc/9E
         tOcptB6WnoqxX8x7ahwYs27tHVBKJH8uhsvZA3gsZjk2v+JclsU4Ce258fkKBKJNJMt6
         7akdyCIpwbgYjjfoj7H5CtySm4wXBjR4JMWUPz8ujAnYU0yAMVUK90pdo9DW4aec5X/o
         huFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oXfwfxqJ3Ud1a18EjbgGs6RmrKLEcJt2awiaooMVBjk=;
        fh=OMm3E/+XXtn7NwLPZZpHnTyrlTtDz0XndjAHIoHZjT0=;
        b=IS2qJUhuX+c1n6xhYgzRdM5CFh1mqi5iuVqFeQFAuFygnO45yTDVK2ulT+lHWYQiPQ
         h9Jiq40pCo9i1bjZC4oUddtforJsM2GpDnATLWSd31oIooOLC14XoHXzPb1nSZ/hs/bx
         AxLMZIChnk5DiW8cOURxWRSoiyPkkn2LwIc/1bCIg/JFTVHCvV6L33PRBOIyKKHLUlp2
         /DSYOE3dLQq/eO7LGgpNXca4vSvknIkBcuZWwr7+OvWZgS9KVJtm4YIu4sxB4rip5IXN
         h0fcsf6UTpByDC0acFRiQX+WRiHWKn+YF5q7i8scCdrl1abNLlQHRmyxdsUXCiZuvW2Y
         ZhRw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1770257496; x=1770862296; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXfwfxqJ3Ud1a18EjbgGs6RmrKLEcJt2awiaooMVBjk=;
        b=XdnAF2xNtFCVDx/hfNoUHeQj963fV/PLeTIprpoohXHuFa3AFrQKg8OT88yrvr+9kc
         qBnuWgOm5UaG9lzJso91a9odnIjO0HL2eiPgSnqkto2VWt1vjx0gtGaGzvZSRqtilLFF
         xlCjUy8K4qaH5jer+DT/6tm5hXhHkNSHOiDNveJYHIZOwy4T00KlkyPAQinmOFrxjXQT
         OJDqqvTnrPuTUTFJIQgctscl0Ddb4kIjFy2VL9kcWSyfINmmhYMPb2nNUVLAiAgnCfbi
         sMKz1KNymB1xuyTFOcyNvsquSkrvKxq3srSaGyjzrB34a48hwj95N2hQcABl0bvvHw00
         dZ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770257496; x=1770862296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oXfwfxqJ3Ud1a18EjbgGs6RmrKLEcJt2awiaooMVBjk=;
        b=I5w/hSuwvMv9/6sImobAxYLiVAZ0npgafwvp5xVG7rWZiQx2UYDbNR9HibGxopmjnP
         GGQKBd2c4PMx84bCmRoylz/ghew6mC58Y1oD0YxTEP3kmEEeU+/V/265SnyO4bvruPkz
         rYD8Rz136nZdFr4IA7HeY6fGAAKCJvv+349AxJ+9IPRKdVjRWRlau34SGwuhVDit+rdb
         4g5cM9aJvI6Inbr9n+yZdsdgmYUbuCl7rcBMape8r7OVo4JkmwMte99zkoNzKuwhNTAW
         GEIaZoQ5sH39D17QSUOa/BSbNkkymN719wJgYe5WmevzUq0Zgan0MD70nnXw+Z7forJY
         7X3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWR3eZTIH1zZzdPl7y4sQASUx/SLyWKl6khqxcAfL1e7AmknaQ2e7GIf3LoxJCsSei5lzbtLkvUVA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzxoV7pA3yKdAPAL+gPsK3Ba42353jPfeurhSlJZRjq1BhjXVMl
	K3JyEGcQc2Zlv3maiO6Xx0F65Bx6sq8WHbaYgEbQtvrkAOaISRk4grKe2tjdmHhesh4uj7RjjNC
	2I00O0S4gxQse9KcwIr3yCYiNReuLVtTMBsngpVylQg==
X-Gm-Gg: AZuq6aKcEikBkeAn528H8SWRXRlMHesOmLeLHLjsP+R89gXWzjOA98tRzH9cWeXyaaO
	iq6e/0XN2+8mNupUo2xm8wMmfFZxWAquuIu1AFL6y/nGF/BbSVZIdCiuUVxvoLAaZrJqDcclYgq
	M7JmzQHsF90KNwjjyjdS6ZUAjSwOnZkCcwAaBI3EdAc6Z/JkgG+NFLt5Fg9B+0p0l7/OXGW+FwK
	m8uJ0H6xTsXEnKZC64mQHKjtwpaEY3YkrZvrySqPnsg91tBKfJy4ZV7kzUxVRCRpFeqRoi5Jg==
X-Received: by 2002:a17:907:26c9:b0:b87:892:f43b with SMTP id
 a640c23a62f3a-b8e9f196585mr325916866b.42.1770257496389; Wed, 04 Feb 2026
 18:11:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1769562575.git.lv.zheng@spacemit.com> <cover.1770195980.git.lv.zheng@linux.spacemit.com>
 <9C0A2AD4850D179B+524146e74e808db90d5f28fcb6ee791cf1d1bfaa.1770195980.git.lv.zheng@linux.spacemit.com>
 <p74snip7yykhogvzqld4gyjlygmd2z4kqnat7w3qj63fwebnmm@dlz6tloevgbs>
In-Reply-To: <p74snip7yykhogvzqld4gyjlygmd2z4kqnat7w3qj63fwebnmm@dlz6tloevgbs>
From: Zong Li <zong.li@sifive.com>
Date: Thu, 5 Feb 2026 10:11:26 +0800
X-Gm-Features: AZwV_QhMZOXglwbGVqgOIj-KY2N0eLcLOg3n2x9z4Uh395TNa1CEOvBa9sxLG3g
Message-ID: <CANXhq0oi9nE7ffLGsz5j8GnC1UDTD-4bE4cantRjW2fXHYrjHA@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] iommu/riscv: Add HPM support for performance monitoring
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: Lv Zheng <lv.zheng@linux.spacemit.com>, Tomasz Jeznach <tjeznach@rivosinc.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Jingyu Li <joey.li@spacemit.com>, 
	Zhijian Chen <zhijian@spacemit.com>, iommu@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 5, 2026 at 2:39=E2=80=AFAM Andrew Jones
<andrew.jones@oss.qualcomm.com> wrote:
>
> How does this relate to
>
> https://lore.kernel.org/all/20250115030306.29735-1-zong.li@sifive.com/
>
> From a quick skim it looks like there's plenty of overlap.
>
> Thanks,
> drew
>

Hi all,

Thanks Andrew for bringing me here, and sorry for the long delay on
the IOMMU PMU driver series.

I=E2=80=99m currently working on the next version to incorporate the feedba=
ck
from my earlier series. The main goals are to decouple the IOMMU perf
driver from the IOMMU driver itself, and to make it easier to add
custom events.
The implementation is almost done, but I=E2=80=99m still working on binding=
  a
name between the PMU driver with the IOMMU driver on PCIe and ACPI
cases. This part is related to how custom events should be added.
That said, I=E2=80=99m thinking that I could submit the current implementat=
ion
first, and then send a separate patch series later to handle the
custom event support.

Also, I=E2=80=99d like to mention that Yaxing has a similar implementation.=
 We
had some discussion about this last month.
https://lore.kernel.org/linux-iommu/2ce9d8be-10b3-48dd-b99e-7358347fc171@bo=
sc.ac.cn/

I think I should be able to submit this next week.

Thanks,


>
> On Wed, Feb 04, 2026 at 05:09:01PM +0800, Lv Zheng wrote:
> > From: Jingyu Li <joey.li@spacemit.com>
> >
> > Introduces perf-based HPM driver for RISC-V IOMMU, enabling performance
> > monitoring capabilities.
> >
> > Note that the RISC-V IOMMU HPM module uses COUNTER_MAX-1 as a static
> > counter index of HPMCYCLES, and 0~COUNTER_MAX-2 as the dynamic counter
> > indexes of other HPMEVENTS in order to correctly index into IOHPMEVT an=
d
> > IOHPMCTR registers that have already been defined in the iommu-bits.h.
> > However the users treat 0 as the index of HPMCYCLES and 1~COUNTER_MAX-1=
 as
> > the indexes of other HPMEVENTS, thus care should be taken in dealing wi=
th
> > counter indexes between userspace and kernel space.
> >
> > Signed-off-by: Jingyu Li <joey.li@spacemit.com>
> > Signed-off-by: Lv Zheng <lv.zheng@linux.spacemit.com>
> > Link: https://github.com/riscv-non-isa/riscv-iommu
> > ---
> >  drivers/iommu/riscv/Kconfig          |   9 +
> >  drivers/iommu/riscv/Makefile         |   1 +
> >  drivers/iommu/riscv/iommu-bits.h     |   6 +
> >  drivers/iommu/riscv/iommu-hpm.c      | 843 +++++++++++++++++++++++++++
> >  drivers/iommu/riscv/iommu-pci.c      |  13 +-
> >  drivers/iommu/riscv/iommu-platform.c |   8 +-
> >  drivers/iommu/riscv/iommu.h          |  42 ++
> >  7 files changed, 919 insertions(+), 3 deletions(-)
> >  create mode 100644 drivers/iommu/riscv/iommu-hpm.c
> >
