Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCF0489FAE
	for <spacemit@lists.linux.dev>; Mon, 14 Sep 2026 16:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789403577; cv=pass; b=TC/tt+M0eVdVNLMLq81oPEGX8dg5ZmsdfC92UdOQ7D1/80VB5f24KV4XCEgXGPy/lDosrXW7TruHwA6chFurDPYslD7q7DKosLP04sb+bOq/+Z8+L75Ml6FZOB3T0gW6YdiyDNLUP9L/ipC0D4rmXlDPHz9mcG6CWRQ9BfNdBOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789403577; c=relaxed/simple;
	bh=hQHVRS3j3qwCMZvufegvdPbwFnAZmaOwqMLjoj+NQog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PSId9zqBppkscEMzxS5CX3vtNxJfSSCiS7YMmUi0YJOUb6PzB0VU3QgxxEq0uyIK1e5b9R0KUI+NjR//zLY4t2yrBp3am/N0S0+AersROSbaZDLs/98LbKtnVoCHSWeDFVYVJ3UYMBBCGOExeWsRfPloPz/U/16mXozRuOzC0m4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=ZHh9Rn8B; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="ZHh9Rn8B"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-8659af7454eso20549447b3.1
        for <spacemit@lists.linux.dev>; Mon, 14 Sep 2026 09:32:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789403574; cv=none;
        d=google.com; s=arc-20260327;
        b=jBfSaSjoDz/qf60jULNqZ+ad49XB943GwxfUw3JaCTlRGQ1msirzi3SLESFcUXBdbY
         CVqlU3ozCTFxJivZelbibkTvmCuj2/IgRi7pUY3u02qGLbfaoPMT3JYfiQBtmFCyjieG
         FtPLJC9sOg+TWOYoObWXPJ19u9Ye5W/BYd1/ZbSE57YkxlFoPN1eO/0sIYiklE5eorkt
         1WLdCw8sEx6y/8l0VSu5zk3Ao6NXKN+soiFOIo5xZGVa7rsKWckiikQFRaHdzukMWAav
         Zm663WHiZPZAJSw6L6in0Y5TsTrs75KrgtAja7ElfgwK+zju5svD1IsE0Ahb+FxSNiv/
         /pwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U2puunLcCA0Ud8zKAQs4npBTHlIwjTI7Amm7eOrF5FM=;
        fh=V/XESqQJOWE/dKnBUvKEsoqaiS56zRIfedhtBbG2sxA=;
        b=o7N8Vwj87tic+LI4G0eEeN3rfbmrnxhfBb6tzVscBFg5EW0Nqb7fUOTuERYFz8PcCt
         66SrP0XZmXf/foIyr7EQ8dYCkUGrUhWWOonbjg4nz8PIPHeSyr3f2oi7da1HUNMgVCk4
         iv8SlITjQVSJlD0d51NvjyOX3d4oBFjKUKadmm5DiLpRl9UfR1dfEfKxq2gKmapo6U18
         ZMzi7kg9MJVaIMHUr8PY73A+uOj/H1ey/Vw1kElpkV3fHyCm+zLIPyA38XQWILHl7TR8
         0iDIwfitCVKFGVplRp1dlGitUsAUohExZsdl88jHGVu1Qg9ZSekNFCRllnUTyLj2ZfEA
         Ekng==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1789403574; x=1790008374; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U2puunLcCA0Ud8zKAQs4npBTHlIwjTI7Amm7eOrF5FM=;
        b=ZHh9Rn8B4qPWbL10A9NvZ4Bg2dTi72sZh8KIU5yQyZE+PxB6VQoJsQKJ9iVhTYoAn+
         gU2JX7YOlQZ9drMbMaJpkTwLt7LSYyCnH9U9RL8UJqsouOjplnyJGbioNTDSapkRdIkp
         +mh9xK9ASBCcHBkcUPHYRpO9dqiTiSo4rGpjGKQM2GqCo4Lil19Fm6P3bpctitzpM0D+
         KRL1Hi/YH1U//LZs+vGYUGEvt8fmQg3EUa/IZ1dqKhvnXvzlHDxKCZWdS5zeNHzIpbKV
         /KrqhkT02otfAP784M6qQPTr+WVOl+H182YfRbKZzYyBdzbMw0q8k3p0CcdLXQEdufkG
         1dCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789403574; x=1790008374;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U2puunLcCA0Ud8zKAQs4npBTHlIwjTI7Amm7eOrF5FM=;
        b=oOWUDxD7yuXbBJDQ3xy26pYAKa9UcjEu7LgKlaoQ4RlLfGEgBr0Me9e73kJuAye11/
         z+HBKGjH/kqT8EH9mskU2lhWAJH5lYKZSO61MVfbLI8fL2sfryJ6qbp7z7mxE/wnmUHT
         x21+VATjBjaaRFJU5fCOH590PMOk9VP1CVMk3mHKxtnQ8h7WHWQjw6FciczMfiyYDFld
         u+AQCAmdupNw1QwdvnsFHdhd0LOr5UIUe/65qrIzdTjbtnJxW60uOBfoFBTd/kR7Gz3S
         eZifEgxbmT5dyum7bZNNSGn1cbLC+8scvaz0xMSHTuZZpiUdMn00pELptlm9NGykYUSI
         NwBg==
X-Forwarded-Encrypted: i=1; AKwUvBwCQACfx+bWZ8T5xeuD7eIEITwg2tynBkUps7fSlfOOXdAruj6RdjOn3qGzWylBSe7ASi3FeP2GHw==@lists.linux.dev
X-Gm-Message-State: AFuF++mzOiAN8JuKZ4hUvfgOm1t0VFB3MLgmqBZkGIHnI/DTEZm06eYF
	+o3vaAxvcjSxwqyV891jcR4qMcQr59tRqjKHTGrblXUYP+xErZilsatZcAShZOcjcrs9fAj2908
	GlnqOhPycqaSDkOHAc0HfKz6WiFXjPm+2uiPezt7Eiw==
X-Gm-Gg: AYBFou1AkYaDwxm7Iy3m5OGoxe1aRZBoR+6N+fi44WSRqhv1mlXG564c9Tq7AiLhO3G
	bJRAARXnfaP8VFenCezfaEpOj2CoTYPGK76PKQmIfS0kAsrqW/zv6STOced9p7ot2yuugyWmQ/C
	v1F1B09kbewv+4VMhd4S+6nPDXWTWkjKkPamFTsANMe6yYZBhIkmYyb3iD1HpTyekBLSHezUwma
	3M4vwNhPcWmb9DPmijJxFkMhfkGseOzOY2LbSkzpxEt2W30uHuEqFtnDJVMN01rt/Zwi379IxCI
	FbfjfhcvzoqrsWAYVDi5wIzoadeq5wFzNJG3K2e4qs9zodM1Ylns/HY2WTABJw1COSicB+Lm+oV
	jjWSdQZbGqxJuCTmt2sNB9D7verUaK3zI6B3Y96dt9WWW
X-Received: by 2002:a05:690c:d8c:b0:862:ec8:d142 with SMTP id
 00721157ae682-88d1f505069mr12332497b3.15.1789403574227; Mon, 14 Sep 2026
 09:32:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908-08-k3-ufs-support-v4-0-22aa2bd97d3b@kernel.org>
In-Reply-To: <20260908-08-k3-ufs-support-v4-0-22aa2bd97d3b@kernel.org>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Mon, 14 Sep 2026 11:32:41 -0500
X-Gm-Features: AcwNN1VyLPHubK4HBe4wLXnzYSfxOmAhK5WWmFPob51Sa4JHSy9JegsQyxuk3OE
Message-ID: <CAEev2e-zQotX9=QCfZxvYHpUD-hSgxbEjsVey4hEc2YbpoRjnA@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Add UFS Host driver support for SpacemiT K3 SoC
To: Yixun Lan <dlan@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@sandisk.com>, 
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, "Martin K. Petersen" <mkp@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>, 
	Jennifer Berringer <jberring@redhat.com>, linux-scsi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yixun,

On Tue, Sep 8, 2026 at 2:42=E2=80=AFAM Yixun Lan <dlan@kernel.org> wrote:
>
> This series try to add UFS support for SpacemiT K3 SoC, the controller
> components consists of System Bus Interface Unit, UFS Host Controller
> Interface, UFS Transport Protocol Layer, UFS Host Registers, Device
> Management Entity (DME), Transport Layer, Network Layer, Data Link
> Layer, PHY Adapter Layer, and M-PHY Interface. A more detail functional
> block diagram can be found in SpacemiT website, chapter 9.7.3 [1]
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
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
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
> Yixun Lan (3):
>       scsi: ufs: spacemit: dt-bindings: Add UFS controller for K3 SoC
>       scsi: ufs: spacemit: k3: Add UFS Host Controller driver
>       riscv: dts: spacemit: k3: Add UFS support
>
>  .../devicetree/bindings/ufs/spacemit,k3-ufshc.yaml |  56 ++
>  arch/riscv/boot/dts/spacemit/k3-com260.dtsi        |   4 +
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts       |   4 +
>  arch/riscv/boot/dts/spacemit/k3.dtsi               |  22 +
>  drivers/ufs/host/Kconfig                           |  12 +
>  drivers/ufs/host/Makefile                          |   1 +
>  drivers/ufs/host/ufs-spacemit.c                    | 678 +++++++++++++++=
++++++
>  drivers/ufs/host/ufs-spacemit.h                    |  79 +++
>  8 files changed, 856 insertions(+)

Tested-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
