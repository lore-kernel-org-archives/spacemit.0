Received: from mail-oi2-f43.google.com (mail-oi2-f43.google.com [74.125.231.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBCB406805
	for <spacemit@lists.linux.dev>; Sat, 19 Sep 2026 11:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789819099; cv=pass; b=FhuTeBk+LZS0seAnAv21RdagobLUhZq6NxkW5dN/IKMIAnLUedyYP3Th+f7afDQdvzGXqmO8pDs9lr0WViNd5acaEAXgRbt7mw2fD1HgR/YrXd1RtRmpsWS6Ii83EnwQ5cj+U05lEXJS6K75tlk9MFRNKp/r8Qy+hLmyoYEifFs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789819099; c=relaxed/simple;
	bh=XbtXTzRAYW02KXholcw2ASApYBFb0BJqI8KGXi9eFzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z+HBYFno19slXiQH6RdZrPbC442jXSI9LS/E/F6bwxVvx3CP6CdUH0D4jQ1QsO6ciT1uf56uAG0ATMYCO092U7RQrj3gEPdG755Y3nksjFNg28jDNDDuZ6GlMqHmmN/lQevMK0pDiOPOcvyFFoQLorQeV3VSEzpez4OEAML6py4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RiuP1NQf; arc=pass smtp.client-ip=74.125.231.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RiuP1NQf"
Received: by mail-oi2-f43.google.com with SMTP id 46e09a7af769-7fccd4c3f36so1210796a34.3
        for <spacemit@lists.linux.dev>; Sat, 19 Sep 2026 04:58:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789819097; cv=none;
        d=google.com; s=arc-20260327;
        b=a4tlbiZj/bOUeCj1N/NdDz1c35BDm344gPS8TYrogQhXBR/p4Pid8lEHgWQS2XVHmw
         dwbU5rOlXfAddSMnS2TszMjCj2shkoja+XoXUaqliHMqXBkaY49Sbtrjd8VJwXD0r3uZ
         t6i52l4DX4VLlNYRqjWAYooWZHKFeiVduDenFqQE+UU+855ZT5Rbwp2VmZ6uJpQsG6g/
         iDWnZz8L5hv4F24FGzBs02HqcaGNpmcQxLnnis6/eryCMl4sn9dG2Lv1j19PJHsdxaMx
         SbVLycEQdvqdEx4e0GTzTLveIIf7S9MXlxd34v5U3x0e9ZnuysJHemMTdLB162s7lxb4
         gJhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ud3FeOiOvyS8WWg6t16DeAqz++YfSh94BtVybhYysAU=;
        fh=+kxEznutqsNqNTY4gE3a6DqagqG5D0k9r/GXe++/cPs=;
        b=H4Av0PhSgaOsf551312Q4naU1iMxsI45ehiOl9rqh/ytr+A3AN2yrHcBydf/5Qqmpk
         3JjxeRY3t8H8G9v6YnQag8P4Td5bviKlbvqxt938e4WkYk+Ng2P5wC9oHjPL1gC+L+sE
         OPAZ1NrATC/5NdTglcurWLnJj8nS56aMCxVOSlB3GUrqReV1D3SY+h7lrUsow3dFZvwo
         9aEzrCrCU8aAG355d1HiROr2s34m1UKQ/pxxxi0X13KOyY8HJp2HxKPgHNmoeePflH+B
         hM6ydX5UgFwz2jPmShCW39/EGgw+mu8y4ptJ9P27ZArnEYMx+6Wx3PQpbNvI103O0fQt
         lhLg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789819097; x=1790423897; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ud3FeOiOvyS8WWg6t16DeAqz++YfSh94BtVybhYysAU=;
        b=RiuP1NQfYa7/lDoJI08zSPxCmk0ecuU/eF2pGy5yIGmzxPuiDiJEIoZ26hcQH/T5Y5
         MdgpGG7MNPVws+RNYuz2YkK7xSOXknIUIiVt3927KWWsFjIJkBiBUYqxAekrDfmdU1B7
         9spFmjCw6R17DxWT6fAghuYY1e3XSwaqPiBEj7ofk4b9zvaDlMpedrqsd/3XuVy59fPO
         ElnxIYqTvQYNJYtpknstqZVnJuG25fbTYC0PE3X7EJ8m0oezRE1lcid0CAEVTqzmsiRB
         m1Co4GVB8utoiRz+l6pryhS6QX+NuqZhi8VsBK4sWH67r3V3/E6rL8QOPxoC0jEjfSAJ
         kH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789819097; x=1790423897;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ud3FeOiOvyS8WWg6t16DeAqz++YfSh94BtVybhYysAU=;
        b=MqAnkurLyExAeyj+6owlQYo81/JhUwjrfzWgl0Nh/SekeoTKiOiYDB2WwXcTa3kkKO
         RGERR+zu7ZjwCNjL4FfaXYY1lk/kpgMe76uhXxmr1i4xYa8jUA21CXyBcRns+QR8wC4n
         muAVLPLliheUslbyo4c95YpBLsANcC9qhpMMT6CG78CnnGQYKHvVEwMvapipcKXnTIjZ
         nEdJ4gJkdpSFqdyYTVmSXaGTHRDcrdfi5f4zxDV/kY9kgA8oGiisskpI8mWw8nXJffdH
         8VZYmpGV2d1oo794Sc179s9437pBMGriFLU6WmDkkuu3QL3+USCsOFl8lsVekPDro3OQ
         k9pw==
X-Forwarded-Encrypted: i=1; AKwUvBxaMaMmR7Wl6Ktjy2BushvVWHNv+WigHR3/MtNeoLNvc+LEfR8/hSaQglIXOv2mMYP+Iv8w19ih5g==@lists.linux.dev
X-Gm-Message-State: AFuF++l66TQhtJEIX6DyNJy5eUY/c1CBlXDmXpOEg/hpx+RmrPQrCrky
	KplFTO+D/9D0h4h43vtGxpaI27WTZOwpWtLuZ2XlsAs+CsrF3VmmrdpfXA4lKGqnVKM5fapk2sG
	6FEtJBIS1HQdvcXzgNlgOq1u4FhTJRqo=
X-Gm-Gg: AYBFou2rdzs2h3VTsiusgkESRRLjG6+RPWnqZZPjrY64+gHP82Dkm20nZb5yT+IY5On
	aP0DZI/+wVRYZT2lzKqT+uCP57T0OOM9Oe0ZlFQWQANMrG+TsfVUTmLQHvBwV/3WeEGhqeeyAyn
	fpnU9UzkczLUQl9lka/2zfBZQW9HDmRNpSY1CeV3RWCOtXRq2kc0WFQ/NZgkfkeg+GSxprJBsSo
	vePCOJYdpT7UwAIkxXtMpzjzdwyoeGl/f2D/2+IrrRBNnGS3YG7/wECfQQ/byV2P8TyVEF430an
	fZBNpnvLq2Qk9h/EyaDAzgYeYzGza+QMTqhrcFh/X2+z3mJcBxDqrlaJXYd3C1cPzzv+yRBdLpd
	qTWz65EAfYxkXXFDmhhLv7LcL7Hxo+SmcbN0aCA==
X-Received: by 2002:a05:6830:442b:b0:806:1728:aed9 with SMTP id
 46e09a7af769-80ddff5b5e3mr6811507a34.5.1789819097212; Sat, 19 Sep 2026
 04:58:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260902-07-k3-sdhci-fix-v1-6-b15c5d0f64fd@kernel.org>
 <20260907155300.1411173-1-alan.tseng.cs@gmail.com> <CABdCQ=Mi3M8vGCYjURicNWy-Bh22qN199jOdHA5rEfTzui2b_A@mail.gmail.com>
In-Reply-To: <CABdCQ=Mi3M8vGCYjURicNWy-Bh22qN199jOdHA5rEfTzui2b_A@mail.gmail.com>
From: alan <alan.tseng.cs@gmail.com>
Date: Sat, 19 Sep 2026 19:58:05 +0800
X-Gm-Features: AcwNN1UZXEwsL9Pov5f9xi5w8glGlreCvMt_9qTwCiXunjbXeU4yHhZxeZNHtl4
Message-ID: <CACwt7EYh9+MZHC7Qn910iOxvnjd42u_NoSX3+YpjQCxCxtY=6Q@mail.gmail.com>
Subject: Re: [PATCH 6/7] mmc: sdhci-of-k1: Improve RX tuning window
To: Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: dlan@kernel.org, adrian.hunter@intel.com, ulfh@kernel.org, 
	long.wan@linux.spacemit.com, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 15, 2026, Iker Pedrosa wrote:
> A jump from a minimum window size of 3 to 50 delay codes is quite dramatic.
> Could you clarify how 50 was chosen? Is there a specific hardware specification,
> phy datasheet recommendation, or test dataset across multiple boards that
> justifies this exact number?

50 is not my number; Yixun would need to answer where it comes from. What
I can add is what the vendor driver does. In SpacemiT's sdhci-of-k1x.c
(bianbu linux-6.6), the defaults when DT says nothing are:

  #define RX_TUNING_WINDOW_THRESHOLD 80
  #define RX_TUNING_DLINE_REG 0x09

The Jupiter DT overrides both together: spacemit,rx_dline_reg = <0> and
spacemit,rx_tuning_limit = <50>. So 50 is what the vendor pairs with the
finer delay-line step, not a standalone default. That makes the 5/7 ->
6/7 dependency concrete rather than theoretical.

I also need to correct what I said earlier. The current driver already
centres on the widest passing window; the "< 3" check only decides when
to give up with -EIO. Raising it to 50 does not change which window is
selected, only whether tuning fails. The 1- and 5-code windows I reported
were never the widest in their boot (the widest was 74 or more each
time), so they do not show the old threshold picking a bad window.

On the form: spacemit,sdhci.yaml has no such property, so a DT knob
would need a binding change. A compile-time default, with DT override
if the binding maintainers accept it, still seems the lower-risk option.

Thanks,
Hung-Chun
