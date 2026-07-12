Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0071A0BF3
	for <spacemit@lists.linux.dev>; Sun, 12 Jul 2026 20:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783887408; cv=none; b=glZoDJW1R/ZxXFBJ6Vv/+/pOckyDMkTn4ojUjQBigqBPb9XGizTdC728wK9XDO5vS2EJ4FgfxXzEjRzBK18ivCkKlNvhNYlGmhO3iimXVuJVtfDtVtctwCOyzM4yleMRqGJaEtvOAmuQHsWGGNCFiw9amTEikOCHoxt6R0tEgEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783887408; c=relaxed/simple;
	bh=3QLR3KK8Id6mI23Kry/sbc3hYjkLOFnlNehgggqEwkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aiC+ZQIIBrx4aayB/XcZUaLDB1OioRcJUXswYiZ5srdOnw/4QttImEZvmbaOATbBC2qe0sp8FmkwWD1ESMwVJBwu5DXh0YosMgrLj8oYnV7zPSlhb/135SiEGQslOySaDLcVNNcen+vSH98W7U+xOBVgISoe6MFrBSgAM9b3l4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=emVoe0LR; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="emVoe0LR"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-81e69a2db34so36597987b3.0
        for <spacemit@lists.linux.dev>; Sun, 12 Jul 2026 13:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1783887404; x=1784492204; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sexe2OJDiMkFGhURClJc1NsMoa58P5WaL0Byl520pbw=;
        b=emVoe0LRQCVjCvkrnFEPyA0PDKxQ0pG2TA17eCDRBge3PvecIUAFUjDNNhcStJqHN3
         KK/0SJ1tBx+PJ3S886PhjshY8wbYFPDJB7pYsjQLK8UU8ooSXZorGxY4W09sopwDuL4T
         7Bs0gCnec2tJPN40UxrYSsBGwGUB73JlZa2xOcrCv5EpJJ6xqXRoZLOo89LM+60/HKMZ
         4D7PJrjl5Nh+SXu9eVaSLqEaVxHgrcvCqDgRzIiuRNsbVTa/bSKxVh1/zsJG29UVVu4M
         ZYCrOZZguQRy9YEXrNS8Kto1CngtYOzehjT8frHQ20NoaA5x1DFMBR/8aSrMEuRwEBCH
         MmbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783887404; x=1784492204;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sexe2OJDiMkFGhURClJc1NsMoa58P5WaL0Byl520pbw=;
        b=W5s+3ZeLHyJoxC6ktJ3wjL97UpBQ6vgWCAhF/EhR2SLsfcDnNuw648p1Oc67WUPJ7u
         ZY6dZE5ZjC5d60fWzkyKr2xRg/NbcggEaYhJ0OUqms0opN3vHmj1DW78FY7tR8lfKRR7
         VlJHyl9Aj4AAlawDyyJNPC3PAElZOp5ViqLC+qq6iOaQsIU1RYiMp+pRx2/NWRO3G3rm
         NqVFaLgLnaKaexp+ZSCMRk3T2mP1PraRo99BL0VpzvRHVlFtph1SvQGVv7Xe+omRqWk/
         /CV9FlDy9CIJXXSLAPI8QJfk32XNLhVGCxiKNb9GRELWrq5k90XNkUIK4RPAncAbJkNH
         qWzA==
X-Forwarded-Encrypted: i=1; AHgh+RrEMCCWNqplfL1DpHtONAbbnGRDaoEXZoW/v2ZabZuigq0jUAXgSyp9f8QeF6RwXhi3hOIhXRjfqg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxtOwGRVepUgzzlo9r0799YeKPjItAW/INhnHkkomrG53aPQq6M
	h8hYgKEBOXNOCBxItmEcEJ3BZnZCC998K2BB1kC17+QY/RKRKyq9pxByPxiGal+RQKw=
X-Gm-Gg: AfdE7cnVO/9XNQVbYjvk7fu0p/u9kVd6MORgrnuhiRuGkyOvNqgNAMHt8ZLIHxXmogN
	2HYA1TKRC2cXoU+1dn9gYnS2baGQaIQ//kdOr2u21mHQdF6bbSGyvNwGPVKjTOPdTuotRb4FGaY
	H9BduvIv+FlGTN0B7hclwlZxg3s7IH2+HqKtRh+965p9F58oTDWJWi3/lX5fkJIAQo6UF6RNHwa
	uk0p/pr0aRc0KzFWW4l1StKXGRhc0gQcU3yOV3OuVAoO6bhURY5IeSptbafV/zmt2AS6WXcQapg
	lvshcfmQFVbZJ2kv7aPxq5MtnnjNdWWrtv1yEgtexDcmD4+o+UQzpeThF3qw7JAAjNXSQ3eWv9z
	cQUxmnnOT1MROfI167D9UlsDWwwp+B8LsGPszrXtjuKpc19B0yPQsDE9htBFlsk483urkYoLPCB
	2OeM3B6u6fo9RPZHS9mFyX5Mc+Lalv8OszZ49jD5lVbqHXTdAy0K7ZeYZ1Io4ZHRmrCUNT
X-Received: by 2002:a05:690c:250a:b0:81e:68a2:89d5 with SMTP id 00721157ae682-81e901b3d89mr51627807b3.55.1783887404652;
        Sun, 12 Jul 2026 13:16:44 -0700 (PDT)
Received: from toolbox ([2600:1700:220:59e0:5e9b:73c6:ee82:165e])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c1f11bbsm98699367b3.35.2026.07.12.13.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 13:16:43 -0700 (PDT)
Date: Sun, 12 Jul 2026 15:16:40 -0500
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
To: Yixun Lan <dlan@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@sandisk.com>, Bart Van Assche <bvanassche@acm.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-scsi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] scsi: ufs: spacemit: k3: Add UFS Host Controller
 driver
Message-ID: <7x3b4sttnc4oxkuvxmpkihfi76lkapjcigo7khgcgfytvol7w2@v5ykuyrk2z3m>
References: <20260702-08-k3-ufs-support-v1-0-1a64a3ab128f@kernel.org>
 <20260702-08-k3-ufs-support-v1-2-1a64a3ab128f@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702-08-k3-ufs-support-v1-2-1a64a3ab128f@kernel.org>

On Thu, Jul 02, 2026 at 02:31:36AM +0000, Yixun Lan wrote:
> SpacemiT K3 SoC consist of UFS (Universal Flash Storage) Host Controller
> which has features compatible with JEDEC UFS 2.2, MIPI UniPro v1.61 and
> M-PHY v3.0 standard.
> 
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  drivers/ufs/host/Kconfig        |  12 +
>  drivers/ufs/host/Makefile       |   1 +
>  drivers/ufs/host/ufs-spacemit.c | 931 ++++++++++++++++++++++++++++++++++++++++
>  drivers/ufs/host/ufs-spacemit.h |  90 ++++
>  4 files changed, 1034 insertions(+)
> 
> diff --git a/drivers/ufs/host/Kconfig b/drivers/ufs/host/Kconfig
> index ff170c0b6da0..4f53b7f7688f 100644
> --- a/drivers/ufs/host/Kconfig
> +++ b/drivers/ufs/host/Kconfig
> @@ -132,6 +132,18 @@ config SCSI_UFS_VARIABLE_SG_ENTRY_SIZE
>  	bool
>  	default y if SCSI_UFS_EXYNOS && SCSI_UFS_CRYPTO
>  
> +config SCSI_UFS_SPACEMIT
> +	tristate "SpacemiT UFS controller driver"
> +	depends on SCSI_UFSHCD_PLATFORM && ARCH_SPACEMIT

Can you add SCSI_UFSHCD_PLATFORM and SCSI_UFS_SPACEMIT as modules to
riscv defconfig (or just add the former and add a default y if
ARCH_SPACEMIT in this Kconfig entry). This will let defconfig kernels
to boot with persistant rootfs on these devices.

> 
> -- 
> 2.54.0
> 
