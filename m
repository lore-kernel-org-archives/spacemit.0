Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB592BDC28
	for <spacemit@lists.linux.dev>; Sun,  1 Mar 2026 01:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772330307; cv=pass; b=CK8m3H4v6dh9tnZdvJAluz3lHvEIhwGfIYGji+HilbOSaKDDKeaj68uCZTJ5zUFmW/oslgBmJoX46zzWVIzxsQ5gQhH2OOXbmebz2tL3ch9D2SvPemLOsX1drXCaGhvShdDSHFdWvgPnOA0HCeWtr8ZojgWqVzDIinQvEbTt4LM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772330307; c=relaxed/simple;
	bh=bVhil1t7ubBiAQLxatRQvkSC+0eijQp7a2xsJoQSnhg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xvxmgg4Pwgl9WNiGSJK4f91q37krngc1UzopjAks7qR5jBprJt4lbFJgGKYULSpJNYkI9007vJdSZCo9ZjCM35/a2/tIo4IupemLUvgM7v4pPd0WRJaP2tsCSSmRsl9zve/OtQsd61ZeAnd0f5DuOBx0SdQk5oXt67+5PJHn1Gg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=GionyJJr; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="GionyJJr"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-65fac0b51baso6555287a12.0
        for <spacemit@lists.linux.dev>; Sat, 28 Feb 2026 17:58:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772330304; cv=none;
        d=google.com; s=arc-20240605;
        b=GKr7hYiJESOiF48N0569AhZ/t+groYdgSOFaZi0wm8ZDF4PH/aXDkQL6dj6IdZ/56q
         j8Ue0oVpz6JrKlzmizc/SMGdXf+N79lTTwscQT+LpvKW3nslvUi6S/pWPnMxdM8bB26b
         xuhcqLIR5PmK3M3hbnjmBKBey8ZQmd6D7Lc0IhKD6Zu5Fd6Eqw+B4oQcxGgiD4+RYCxz
         HE8TB2OS5AjOwutvhlDo3QBAoX0eA4KLhzp5lEaS/p2Ks6FvaKK2ztv3GOguemlf9qgh
         7VRFfeEClKgXCo8Mdv6EoeJjV9vmLAgsg4aw10LIW3uGaESIcApkSdHb8z/nYbwGoxO8
         ++nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=54nUUoZYBk6/nmzbYKQgAP9HVkFunlgn9EvNWRbux98=;
        fh=RpVz7WrFknkNJ4c+p661uup6Pn0xw/4sxlZ5RRYkZR0=;
        b=iQ+qcQm9ISop7DXJjFWv7tq4l5unndZhgArj08IN3jBiuYqaAcGsNC09mdTHZgjJ6A
         qJdHNUZ4HAhAelq7s+tH+fGJ5d1ijEjiuJ6cDFU9gxgk09IZTelyJrH03S2p3d15fBWg
         8T1wnqV6mmWi7i2ooNMvjgzXAemf+0+wnYzDNtbnq52fe2KGodTBc4XMlRMlLS3pJi7p
         LVrLm5U5pbOsHoPzdVF6wCPZ/I+zYLdHSBLL/qSP1vFD1JcHtIrJBO2dMLeFhG+onVq8
         oE2l2Bu/YG6Ht4k0LZc4OPPK/gMsD7lAs0/wiBlFKNQ1LcjQZQbzFK6OHqY8upx/iBHj
         BDlw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1772330304; x=1772935104; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=54nUUoZYBk6/nmzbYKQgAP9HVkFunlgn9EvNWRbux98=;
        b=GionyJJr2au9OJxlerL0UMuFYUNj7sVii73MwxjrUSD2InwAicAGgXN2ZBEJUtJJaT
         PKqAl9cEdGu3VheYezPyCHSXx6iqWfLWZrUopMu7S7zeZcRsYRNRooa+HS3pgHwk9VQR
         L4hVK9lT3UK66kM9bCpv4vNNXsd3MT/pu2XT05SAWTk0SgJ2hu6Y7T2TkSHzxAxPG9WT
         pvFqKyhif+MZIGvQMi3YjpY/ik4KnygNs6ysdde70bSs4yX5vj/p7c82HUZjJu6yXTiJ
         rE8T1jKLw1b7n9Mp3YAb9EW8bu5/efGAv6TeLoHMsSuBY24szQg4gM0DLXFy82+K1NbZ
         HGTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772330304; x=1772935104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=54nUUoZYBk6/nmzbYKQgAP9HVkFunlgn9EvNWRbux98=;
        b=E5X0pMxJlsM3uZvLz7xvuXzm1DtIdemOZUt4cgvqihCbWrDP8bVhvcfhcQr0noXc2h
         W+B5zZ6VmPNEkS25LAOQnOCJIaMfKYnXBLThsD+3ymGUYCSMSrw9pjuF2+YWT/oqp1KI
         X71Cxm9JeSougWAExD0UYQcvY2Kx7X28fdkklwCyx2QhmEWqCNr+YENh+iTc7lR5cXTf
         Dw3+FHQMQQ8834yG6aU+kUpBNcZhS1l3zTOCNhTJBGpkjuXAEn8iCOLs00xisld+ZctJ
         PnTaOaiWhsP+v1jYrbVo191wHh1VoOMYnWiOG9WoYlQlIjKpX21jaj/FtX4jjOQ5fXFU
         5Lnw==
X-Forwarded-Encrypted: i=1; AJvYcCXNZPbJK8INNwq8q77yxLpL5IKq4OFiQYrjRQHA7nYwnXFY4zQiY/MYPnaWx1aa6AVpCN/ExEd0jA==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywq+iJrOPRjXiXbeCcJ1xKZ2M8XCuimkzTxp5Jvm51pT+q5jqLt
	uz2WNgmTo1BnxyslbDeKvyvdoo0rlYuVq+uzcruHFAHjscewpqi94HZ//avbE8SFEyUH3YE0LA4
	FiQ8p+cmW3Qp8WOl2zJGZuProzGN5dR3uxPHTRtXcTg==
X-Gm-Gg: ATEYQzwgIhfmjDOxm/ZPnXKhlOI0HGKyghwotZ2nAUACuM9aEmoK/v+KFuK4XBlnNjf
	K8pOpWg0u72RjW3NpDl7ccwueWv6phmWmH95shnF4uVoRf4bZ8K29fhAssFNvX/pEU/R/vD0reO
	qDXZLu1PjgGLUiVMHUKyhUxaJu/mKINeflN1wmnk4FHXxdUTFFJ28aKAhdjfZk5HByP2SJVH9n8
	tGzgH+ju+eDvGB2tuwlU5APFvfL5aYhVPVt6O8h/IvNS/h88hVZDlV4yuwjk+zL8MD9MGkBZmU2
	mdeIF+MyJQ==
X-Received: by 2002:a50:ee17:0:b0:65a:22d5:7b63 with SMTP id
 4fb4d7f45d1cf-65fab6651b6mr4667409a12.0.1772330303825; Sat, 28 Feb 2026
 17:58:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <0CA1C3965143B3A7+cover.1772289741.git.lv.zheng@linux.spacemit.com>
In-Reply-To: <0CA1C3965143B3A7+cover.1772289741.git.lv.zheng@linux.spacemit.com>
From: Zong Li <zong.li@sifive.com>
Date: Sun, 1 Mar 2026 09:58:17 +0800
X-Gm-Features: AaiRm52qOWLub30nWjAt6tJggFFKYVIu-tGYIIKePM15Tk_NmHt3UvAlC9ff53s
Message-ID: <CANXhq0o6JELxZETcfdsr2i6Xp6SCbwAxnMdfjXkyGRi2EeWsNA@mail.gmail.com>
Subject: Re: [PATCH v5 0/8] iommu/riscv: Add HPM support for RISC-V IOMMU
To: Lv Zheng <lv.zheng@linux.spacemit.com>
Cc: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Yixun Lan <dlan@kernel.org>, 
	Jingyu Li <joey.li@spacemit.com>, Yaxing Guo <guoyaxing@bosc.ac.cn>, 
	Zhijian Chen <zhijian@spacemit.com>, iommu@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	Samuel Holland <samuel.holland@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 28, 2026 at 10:44=E2=80=AFPM Lv Zheng <lv.zheng@linux.spacemit.=
com> wrote:
>
> Includes HPM support for RISC-V IOMMU. The HPM hardware mechanism can be
> found in the recent announced SpacemiT SoCs (K3, V100), where T100
> (SpacemiT distributed IOMMU) is shipped.
>
> The RISC-V IOMMU specification defines optional HPM registers (IOHPMEVT,
> IOHPMCTR, etc.) for performance monitoring of transactions through the
> IOMMU. SpacemiT T100 implements this specification with a distributed
> architecture: the main IOMMU (IOATS) is complemented by up to 64 IOATC
> units that cache IOTLBs adjacent to DMA masters. Each IOATC has its own
> HPM counters and PMIV interrupt.
>
> This series introduces an auxiliary bus framework to allow the HPM
> functionality to be implemented as a separate perf driver, keeping the
> IOMMU core focused on translation. Vendor-specific extensions (SpacemiT
> T100) are layered on top of the generic HPM infrastructure.
>
> History:
> The first revision of this series is posted without the awareness of
> other on-going discussions. There are other postings providing same
> functionality as [PATCH 2-3] in this thread:
> 1. Zong Li:
>    https://lore.kernel.org/all/20250115030306.29735-1-zong.li@sifive.com/
>    We aligned with Zong in the community here:
>    https://lore.kernel.org/all/CANXhq0q8N5eHx9ytabZR97Y7AULKwgS2-uEGhcaOO=
Gp9mvbtRQ@mail.gmail.com/
>    >> Perhaps I can first post my next revision to the mailing list (hope
>    >> it won't waste the community resource), so that you could have a
>    >> chance to review it and see whether that version is architecturally
>    >> closer to what the community is looking for, while also addressing
>    >> your issue. If you also feel that my next revision meets your needs=
,
>    >> perhaps you could append your additional implementations on top of
>    >> it.
>    >> Of course, if the community would prefer to go your version, I'm
>    >> perfectly fine with that as well.
>    His newest version can be found here:
>    https://lore.kernel.org/all/20260208063848.3547817-1-zong.li@sifive.co=
m/

I don=E2=80=99t think this v5 series is appropriate. In the beginning, you
posted a similar implementation without sufficient discussion, but it
might be ok because as you mentioned, you did so because you were not
aware at the time. However, in this v5 series, you have again included
our implementation concept without prior discussion or agreement
(i.e., separates the IOMMU PMU driver into drivers/perf/ through the
auxiliary framework). This may not fully align with the long-standing
open-source collaboration model in the Linux community, In addition,
our v2 series is still waiting for feedback and responses from the
community. I believe it may not be appropriate to directly take our
implementation and include it in your series.
https://lists.infradead.org/pipermail/linux-riscv/2026-February/085349.html

If you would like to build on top of our implementation and add your
own changes, I think a better approach would be to first communicate
with us, and then at least cherry-pick our implementation as the
initial patches (i.e., patch 1 and patch 2). After that, you could
place your own changes starting from the third patch.


> 2. Yaxing Guo:
>    https://lore.kernel.org/all/20250915020911.1313-1-guoyaxing@bosc.ac.cn=
/
>    Yaxing and Zong aligned each other in the community here:
>    https://lore.kernel.org/linux-iommu/2ce9d8be-10b3-48dd-b99e-7358347fc1=
71@bosc.ac.cn/
>    >> Hi Zong Li,
>    >> Of course yes, absolutely - I wasn't aware of your earlier
>    >> submission. Please go ahead with your version.
> This is the newest revision of this patchset, and [PATCH 2-3] is the one
> that is competing with other contributions.
>
> Revisions:
> v1
>  Initial release.
> v2 (sent as v1.1)
>  Split and cleanup DT-bindings.
> v3
>  1. Refactor using vendor specific compatible.
>  2. Implement vendor events with a userspace identifier.
> v4
>  1. Drop ICVEC check which is not that usful as WSI device tree can use
>     only 1 vector for IOATS CIV/FIV/PIV/PMIV.
>  2. Solve DT binding check of "interrupts/maxItems" attribute.
>  3. Address Robin's comments for an old revision sent by "Zong Li".
>  4. Limit IOATC enumeration by referencing spacemit,riscv-iommu.
> v5:
>  1. Use correct style SoC/IP specific compatible.
>  2. Address all on-going comments in other threads.
>  3. Split compatible into SoC specific and IP specific.
>  4. Switch to use auxiliary device framework.
>
> The tested result can be found as follows:
>
>  root@sdfirm:# perf stat --timeout 5000 -a -e spacemit_ioats_hpm_0/dd_wal=
k,config1=3D0x20c0010000000000/ dmatest; sleep 1
>  [  453.426404] dmatest: Started 1 threads using dma0chan0
>  [  453.437152] dmatest: dma0chan0-copy0: summary 1 tests, 0 failures 212=
.04 iops 212 KB/s (0)
>
>   Performance counter stats for 'system wide':
>
>                   3      spacemit_ioats_hpm_0/dd_walk,config1=3D0x20c0010=
000000000/
>
>         0.190412000 seconds time elapsed
>
>  root@sdfirm:~# perf stat --timeout 5000 -a -e spacemit_ioatc_hpm_1/tlb_m=
is,config1=3D0x20c0010000000000/ dmatest; sleep 1
>  [  117.599620] dmatest: Started 1 threads using dma0chan0
>  [  117.610698] dmatest: dma0chan0-copy0: summary 1 tests, 0 failures 186=
.07 iops 186 KB/s (0)
>
>   Performance counter stats for 'system wide':
>
>                   7      spacemit_ioatc_hpm_1/tlb_mis,config1=3D0x20c0010=
000000000/
>
>         0.196982000 seconds time elapsed
>
> Jingyu Li (3):
>   iommu/riscv: Enable IOMMU DMA mapping support
>   iommu/riscv: Add auxiliary bus framework and HPM device support
>   iommu/riscv: Add HPM support for performance monitoring
>
> Lv Zheng (5):
>   dt-bindings: iommu: Add spacemit/t100 features
>   spacemit/t100: Add global filter awareness for RISC-V IOMMU HPM
>   iommu/riscv: Add SpacemiT T100 IOATC HPM support
>   iommu/riscv: Add vendor event support for RISC-V IOMMU HPM
>   perf vendor events riscv: Add SpacemiT T100 HPM event aliases
>
>  .../bindings/iommu/riscv,iommu.yaml           |   58 +-
>  MAINTAINERS                                   |    5 +
>  drivers/iommu/Kconfig                         |    2 +-
>  drivers/iommu/riscv/Kconfig                   |    1 +
>  drivers/iommu/riscv/iommu-bits.h              |   12 +
>  drivers/iommu/riscv/iommu-pci.c               |    8 +-
>  drivers/iommu/riscv/iommu-platform.c          |    7 +-
>  drivers/iommu/riscv/iommu.c                   |  306 +++++
>  drivers/iommu/riscv/iommu.h                   |   25 +-
>  drivers/perf/Kconfig                          |    9 +
>  drivers/perf/Makefile                         |    1 +
>  drivers/perf/riscv_iommu_hpm.c                | 1012 +++++++++++++++++
>  include/linux/riscv_iommu.h                   |   83 ++
>  .../arch/riscv/spacemit/iommu/sys/ioatc.json  |   30 +
>  .../arch/riscv/spacemit/iommu/sys/ioats.json  |  163 +++
>  15 files changed, 1715 insertions(+), 7 deletions(-)
>  create mode 100644 drivers/perf/riscv_iommu_hpm.c
>  create mode 100644 include/linux/riscv_iommu.h
>  create mode 100644 tools/perf/pmu-events/arch/riscv/spacemit/iommu/sys/i=
oatc.json
>  create mode 100644 tools/perf/pmu-events/arch/riscv/spacemit/iommu/sys/i=
oats.json
>
> --
> 2.43.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
