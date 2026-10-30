Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793380752;
	b=keGwQ9rM3Y91FbdJa9075pRzFOMx5FkUHPist4ZG/wRpqsDMXDWrj6X6ardwazo2K6Ys
	 6Ly+Rv8VPDD3MhOI32QPLgTtUjtJjDABNal8Ru33FGv+X4zMHk2E92hWpdtry+RDwdJhn
	 1/5V6q+LuFDfH1FNBOxm9rveHc23GNRSZ+L9ZHxflGWkQ8B3ZpJx85zxp9+HQAzYXxU/t
	 IzhgsFZEe7Cs/+X0+MzNtWUwDsXK6pknFICwHFIemqkFqDw0HmyP7uZufudq1IZnYJffx
	 Y8nZG09Iyut4apa6MAbR7eBtKdzWthP5C0q82JAa8ZWSDI4XLHMLsyHOQKJb/r+R4ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793380752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:Cc:To:From:X-Mailer:References:In-Reply-To;
	bh=JauK/xMdQboHkyA0i/AilFknl7ToPebcspkolAFjyJc=;
	b=L8C0fjYfmIjnlkQUo320XoYhkkQNxkHZdDuWWuX4ONipPdsOcdTH84/pHFievRiAG1zL
	 IDFnclRgMaljCT3kHFgiCYx+Mr0JlpJIzE3OSLYHrOO6uERcdvH1F35/LfyZdidjr075/
	 pXQsMZOdy0zeGIs2IbUzHOHu8s2DjsPw4tCKStJNvuWNZ8RyqLTtNg8gTtn28JagRepZ3
	 th3X3KJ/E9kPJI99shPFiwyXPyLzr+dSYtRI+Z/J6pV6YWR8hECStOnHwkcJ/zs4bhYO0
	 7NN4mXboQzF8nrnwpmOIHi5FZdyNsKc+sXwbS0jZp2mnEfYnnZAFS+eN9/3xu7buUxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Rsb4XItF;
	arc=none smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D235606A31F
	for <spacemit@lists.linux.dev>; Fri, 30 Oct 2026 17:19:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D235606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Rsb4XItF
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91b55859245so14039996d6.0
        for <spacemit@lists.linux.dev>; Fri, 30 Oct 2026 10:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793380750; x=1793985550; darn=lists.linux.dev;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JauK/xMdQboHkyA0i/AilFknl7ToPebcspkolAFjyJc=;
        b=Rsb4XItFZbCffZxRwwZw8kdnwjsFgvbS0pRHHAyipO/lbeFTTBlPfF8N7tlxIl58tE
         yzE0yDvvNwT1cPBedQdjfl11p53O7ZBi6ULw05JBD3jMaQRjk4rfR6Z03dQEMqf3b2xR
         WVLLjhOnOcZdK82UvR691uP3sPe2/91+MVyZf4wgV7Aw9Ut+9TECZX/n+hNO+rfAka6L
         afP5hZiF3pTUJ8CvSFjLFxe+O/zNKSnhlATqeUYPCytlCLQ2Pzi8o3ICePV6NyGDKas5
         LL4i5Xw7AKJjtfM/F0eDlovlbx9nlgKsSocVNWVRX3wiL1aJFW7R6tWu4xnhbK/+9xpD
         qyhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793380750; x=1793985550;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JauK/xMdQboHkyA0i/AilFknl7ToPebcspkolAFjyJc=;
        b=W+7Vb+hARd1/TckomfsuIbO/VtKjLZWwVa1W+L11uio53NSpe2Sef2KlieItHRxumE
         ldaeiwwe0GcX99tWwSiSsSmf6/m1gWLtYx0/eLX3TBLJsafD+Nel0ofZGhBOJ4/1wZn2
         z3CGtyF6kXqIycqNE/A+KsbN3N0REIfP3XpUHYp4hhEsCfd2tSBoQSUzFi6O7/Z2w/2p
         kDnHhmOLlmy7Ty6Eo9/1Z2vGgCbUPf03Fc3dVVauHeevDbT9ORjmWy4VZuCHqF1lr2rg
         f1tacCv6gwPx1LkzA+NM5Yilm+tYFPukeEinsPNKpsHEwXlMoA9a7uPn8aDZij3g6oC+
         q2kA==
X-Forwarded-Encrypted: i=1; AKwUvBzkqV/Rn4dOWNRUPrw0UH8tPO3D1+h8Y4HSidWyHUzkU0Q9FtmRMJ4xpaHG8IZjXpvLbxuYqqVZEQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYImfcgWOoy3QmBUmPzeyMqx6Im3xnn3X1psjvuVzrPd7AxD8gs3
	D9fgue8BIdGAcP0M+dYM55b+c/6hJTA/U9/a1jz6kHrsvGQmW2jbLubvxUvfW2kWaxU=
X-Gm-Gg: AYBFou1YeYTWRz87BoCZDSiN5yjM4tfkcGSJCakl57u81HUplZOMgVRQZOqmSVCX/t8
	nPHPI/qXoVtsSsqNr4WBOA8jm24NLgfiTa7liubw67O4O69d6a6DGTjFSdO8FfxERzCh7XQ8h/D
	7wYZOI43e6SuTxUTaCZ6wcF2l2hp5xYGZg5FcLF+e7nQR0mL172T0ZDu0Xz+E+K3Qrncqw22E6C
	Z+eT6frOz9dDMoAgTyer8wP6WPWeYiqjzXFwRrln84hcJWmL4w47abSlXTpub+hzh2ZXm9v54BC
	cjT02C6MbmUVPXsirZ04ldC/lVW6b/iJThIG9l8qriBGCIzixoY6ou0KtL47n5OBCTm7veBhdAG
	74SHZWEeeovD91o1WCe1aEAM7SmBmNvmHXJkMSQQ4fzSk8fzwuMyLE4tXEQs1FFuCtbfFuW+alQ
	/6GxiA1WxNmcXaQGvKUR5+vjP68Yh/DKFwhk85MY0Nz8qDHqrdLJbkL8X0mpDBeibEWFHuAneMB
	osZhP73J6zbi1b8rgi/y+lW2Dy+SWLjPBhTlob7ao3FZlYmbg0/cYqL87K80mlOChSYuxvxu7sb
	NQ+fhFhyg/cBgH38bOrfMYNc4jjCM6XNlQM98NzJ8VLj8qm6edAbLjv6flc5gCcx
X-Received: by 2002:a05:6214:e82:b0:91c:71a9:34a6 with SMTP id 6a1803df08f44-91ca4b9af72mr48585976d6.37.1793380750212;
        Fri, 30 Oct 2026 10:19:10 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:1977:be2f:4a71:2892])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca7f3db1asm20663476d6.16.2026.10.30.10.19.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 10:19:09 -0700 (PDT)
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Oct 2026 13:19:06 -0400
Message-Id: <DMICF1DA617T.1TZ7DMV5WG818@baylibre.com>
Subject: Re: [PATCH v7 0/2] Add UFS Host driver support for SpacemiT K3 SoC
Cc: "Anirudh Srinivasan" <asrinivasan@oss.tenstorrent.com>, "Aurelien Jarno"
 <aurelien@aurel32.net>, "Jennifer Berringer" <jberring@redhat.com>,
 <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Yixun Lan" <dlan@kernel.org>, "Alim Akhtar" <alim.akhtar@samsung.com>,
 "Avri Altman" <avri.altman@sandisk.com>, "Bart Van Assche"
 <bvanassche@acm.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Paul Walmsley" <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Martin K. Petersen" <mkp@kernel.org>
From: "Trevor Gamblin" <tgamblin@baylibre.com>
X-Mailer: aerc 0.22.0
References: <20261002-08-k3-ufs-support-v7-0-bb39007ff9ae@kernel.org>
In-Reply-To: <20261002-08-k3-ufs-support-v7-0-bb39007ff9ae@kernel.org>

On Thu Oct 1, 2026 at 11:10 PM EDT, Yixun Lan wrote:
> This series try to add UFS support for SpacemiT K3 SoC, the controller
> components consists of System Bus Interface Unit, UFS Host Controller
> Interface, UFS Transport Protocol Layer, UFS Host Registers, Device
> Management Entity (DME), Transport Layer, Network Layer, Data Link
> Layer, PHY Adapter Layer, and M-PHY Interface. A more detail functional
> block diagram can be found in SpacemiT website, chapter 9.7.3 [1]
>
> The DTS patch has been dropped in this series [2], and will send
> in separate series once this patch accepted. For people who want to
> test UFS driver, please grab the DT patch from version v5 [3].

Hi,

I've been testing this series (and the DT patch from v5) successfully using=
 a
v7.3 kernel in Yocto's meta-riscv layer. It's been working well with fastbo=
ot
flash in our nightly CI. An example:

https://forgejo.baylibre.com/tgamblin/boardgarden/actions/runs/827/jobs/9/a=
ttempt/1

For both patches:

Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
>
> One known issue is that the device will occasionally raise BKOPS interrup=
t
> when doing some high load test, log from dmesg shows
>
> [  806.710763] ufshcd-spacemit c0e00000.ufshc: ufshcd_bkops_exception_eve=
nt_handler: device raised urgent BKOPS exception for bkops status 1
>
> Link: https://spacemit.com/community/document/info?nodepath=3Dhardware/ke=
y_stone/k3/k3_docs/k3_usermanual/09_memory_storage.md&lang=3Den [1]
> Link: https://lore.kernel.org/all/20260918-belligerent-succinct-kraken-7f=
a592@quoll/ [2]
> Link: https://lore.kernel.org/all/20260916-08-k3-ufs-support-v5-3-1f5d71f=
1027d@kernel.org/ [3]
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
> Changes in v7:
> - check err return value of ufs_spacemit_quirk_host_pa_saveconfigtime()
> - Link to v6: https://patch.msgid.link/20260921-08-k3-ufs-support-v6-0-34=
79768a2299@kernel.org
>
> Changes in v6:
> - drop unused macro and dev_req_params
> - use global PX_xx macros
> - fix axi clock name
> - drop dts patch
> - collect tags
> - Link to v5: https://patch.msgid.link/20260916-08-k3-ufs-support-v5-0-1f=
5d71f1027d@kernel.org
>
> Changes in v5:
> - adjust clock names
> - add runtime power support
> - collect tags
> - Link to v4: https://patch.msgid.link/20260908-08-k3-ufs-support-v4-0-22=
aa2bd97d3b@kernel.org
>
> Changes in v4:
> - fix clock and reset settings
> - drop function which retrieve value of tx_lanes
> - propagate return error of ufs_spacemit_dme_set()
> - check return value ufs_spacemit_check_hibern8()
> - drop call to ufshcd_vops_phy_initialization()
> - handle compiling warning if CONFIG_OF not enabled
>  add __maybe_unused to ufs_spacemit_of_match
> - Link to v3: https://patch.msgid.link/20260806-08-k3-ufs-support-v3-0-03=
7fb322acdb@kernel.org
>
> Changes in v3:
> - collect tags
> - fix dt-binding warning reported-by sashiko
> - fix low freq in opp-2 table
> - fix err checking in check_hibern8()
> - propagate err code in link_startup_notify()
> - update documents for event_notify()
> - ufs clock driver is merged into v7.3-rc1, update cover letter
> - Link to v2: https://patch.msgid.link/20260725-08-k3-ufs-support-v2-0-45=
036a2a2418@kernel.org
>
> Changes in v2:
> - fix missing interrupts property
> - move ufs node to k3-com260.dtsi
> - convert freq-table-hz to operating-points-v2
> - rework reset_control, fix header and drop global variable
> - drop dump_host_regs() debug interface
> - converge and refactor dme_set() operations
> - massive reduce of busy delay() loops
> - drop vendor specific hce_enable_notify(), fallback to default
> - drop unused member from struct ufs_spacemit_host
> - add COMPILE_TEST support to Kconfig
> - comment style fix
> - Link to v1: https://patch.msgid.link/20260702-08-k3-ufs-support-v1-0-1a=
64a3ab128f@kernel.org
>
> ---
> Yixun Lan (2):
>       scsi: ufs: spacemit: dt-bindings: Add UFS controller for K3 SoC
>       scsi: ufs: spacemit: k3: Add UFS Host Controller driver
>
>  .../devicetree/bindings/ufs/spacemit,k3-ufshc.yaml |  56 ++
>  drivers/ufs/host/Kconfig                           |  12 +
>  drivers/ufs/host/Makefile                          |   1 +
>  drivers/ufs/host/ufs-spacemit.c                    | 652 +++++++++++++++=
++++++
>  drivers/ufs/host/ufs-spacemit.h                    |  77 +++
>  5 files changed, 798 insertions(+)
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260605-08-k3-ufs-support-c8b308e415e2
>
> Best regards,
> -- =20
> Yixun Lan <dlan@kernel.org>
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


