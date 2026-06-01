Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF793AD512
	for <spacemit@lists.linux.dev>; Mon,  1 Jun 2026 13:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780321739; cv=none; b=iPPWwnx7A1hPb4Jdt7CoNYg07F4FXkMyxRse53qHVdq82gxSBPjb6jQxa/od1obYK5z+VknrgFg2dDKfvs/Q5ovbsz8CazVKF6H9hM903+KX/d5cPqduf25blhVpFCjHen4gmtUgp5t63VtCmuw5iG/2844QumKWaYC0/MtdPi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780321739; c=relaxed/simple;
	bh=eMgr26zqpUWEfGdnWnZtaww882I/LH2K/zYJ5x4t3Fk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mTSDcAezGsXhDXgCG1/NnCU82qas6pcY035MaiePhdFyx8B4JDQH5Xqfpy3dJ99yPdNr9Vh9+UjO9uhj4zGyE80b17Px4X5iipgnFGMNXsOuAC+IJqAHkhflXmSQ2bf+oq7pbFWtT4hli4s6zTDaJaKu3guN3KIUrmqCfOdIfxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=E2gcTJ2o; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="E2gcTJ2o"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7e634c4b74dso6442279a34.1
        for <spacemit@lists.linux.dev>; Mon, 01 Jun 2026 06:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780321737; x=1780926537; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YnqHQ3jbidHyMsdxP5WVvXIahQeGSDVtTRMCSxLm0G4=;
        b=E2gcTJ2o5KBL06DMR9DDktJZzBUylFMUTw3dvjScPxh8gKY0A6fFiVAurpisBl6iIa
         oZiW4JCMJANKY0YTjU6OXCVAZlq/znESzhZvZ9HiqJxQIryNCz0VIXxX6D3gn6fQvOcZ
         SrZj9Cwe0Qi6CLjJoqMX6KgPZo2qUmcMcBR6rFk3Z6I3GpSWVelYXApj2r7ijgGeQp47
         ypNXKTX9EGazN49g5Xzx++R6q9JqztR1FkDx7ULdBYB2EJVS2eIYTjsHIAKTnliPvg26
         G1a3eZZX2gCkAwrRiy/Zy+z2CAdlFaI/MwHTlE3HhIj4DgFoiv8wqk+xuF2EmfEMrPxZ
         Mxag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780321737; x=1780926537;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YnqHQ3jbidHyMsdxP5WVvXIahQeGSDVtTRMCSxLm0G4=;
        b=fQw0/PtNBTLA54+oGHVbv4ABdfWnFksO5suwUSUrkBh93a2MnvAgAsUIv8erqc10xP
         PLjivkvTSMvvTAlbFIMPeOwiPrmYcGjmKCSEHRND0mQT0lq789J+VoP8DGdqcB4OTErp
         64+Kvcku42vjnRdPovA9fSu0XkXtbt3AFAIpkNDCOe8XIqd3/hW9RVh0Q/exqCkoD1nt
         pT9wEch82XaKQhrLND8Y2Q4zO83IFLQh/7s8aO4+YSyFertE0Xlwb2vlSZ+Obx1nk5+i
         XGLQkl5j9qvRYUnUPbxGxCAxfBVbdtogW53KyDjImT7QEm4gGVvJr1/HkbX9QyTJ6A57
         XPiw==
X-Forwarded-Encrypted: i=1; AFNElJ8Jd0fwv0qJwNdIkb41m+JMPydWe/uSJhAmPCqzPm8B3D8wHz1YuiAx739LW4t/4i9cKC3NwkG74A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxqkl7kmQhVMp17SS3S/J9a6imAA29gMu/zyjVcGzR/jOPGVUQQ
	tgjxLYCTjOJOmbEuz8wDHQq3sG/Bz8zVdTbJCHzwrcFAg1+/w3gglJO/RvNF3piCApc=
X-Gm-Gg: Acq92OF8gbkwH32pSeYln42tpqhXmV4iw7TntdbNqIPu2y2AZyK94K/c1ymsSKFn1vg
	9Rylh8LGdJha//RjIh3mRckaLKuj1ij/q/CcBG6Lf7zK2ewzxcVHTP07de1Om9lbhVaVNq8Suew
	Xxt51IE9rPQa4Zn7wzfLbs6Pm4RamfTB98xmzZGFDRTc5Q/S9a5CxPlKzFooDLdqC0jo8E53p0P
	s+jerdR3LsZZExn77ty18QijYQ84OucWXSQo+pM20gW4Bc3io5SQ5kzAmLwbf3QTA/jY5cUXa4+
	Wt/LQPIkaQNhObDdbSYqP9yHnE1lKT2Z3jJQyCdaEG3XVgOkJ/B1YWQWHu6HPUTmpbbqS2QZJNY
	trmiWAlQ3f+i5MiPbXxqHpKQTDtV1FlHn00ng1Mp8RqSwcBIBDbnG5suOE6b84ZZC9COgsxs4xG
	AbGml0tZ33BfxNivY/XlO7vqC/9Plf6hdF7w==
X-Received: by 2002:a05:6830:6d0b:b0:7d9:7209:4378 with SMTP id 46e09a7af769-7e6a1e243d5mr6945907a34.17.1780321737233;
        Mon, 01 Jun 2026 06:48:57 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e695d6d463sm7802766a34.23.2026.06.01.06.48.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 06:48:56 -0700 (PDT)
Message-ID: <ec6b44cc-ae24-4497-aeb5-8465c20e4b74@riscstar.com>
Date: Mon, 1 Jun 2026 08:48:55 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add entry for SpacemiT reset controller
 driver
To: Guodong Xu <docular.xu@gmail.com>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, Philipp Zabel <p.zabel@pengutronix.de>
References: <20260601-b4-spacemit-reset-maintainers-v1-1-1ab3014e9a35@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260601-b4-spacemit-reset-maintainers-v1-1-1ab3014e9a35@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/1/26 8:35 PM, Guodong Xu wrote:
> The SpacemiT reset controller driver under drivers/reset/spacemit/
> (common code plus the K1 and K3 SoC instances) and its reset-ID header
> have no dedicated MAINTAINERS entry; today they fall only under the
> broad drivers/reset/ entry of the reset subsystem and the N:/K:
> catch-all of the RISC-V SpacemiT SoC umbrella.
> 
> Add a dedicated entry and list myself as maintainer. I introduced the
> drivers/reset/spacemit/ subdirectory, moved and refactored the existing
> K1 reset support (originally written by Alex Elder) into it, and wrote
> the K3 reset driver. The series that created this directory and these
> files is archived at [1].
> 
> [1] https://lore.kernel.org/spacemit/20260120-k3-reset-v3-0-effe87f4bdbe@riscstar.com/
> 
> Signed-off-by: Guodong Xu <docular.xu@gmail.com>

Looks good to me Guodong.

Acked-by: Alex Elder <elder@riscstar.com>

> ---
> I contributed this driver as Guodong Xu <guodong@riscstar.com>;
> docular.xu@gmail.com is my current address. A matching .mailmap update
> has been submitted at
> https://lore.kernel.org/all/20260601-b4-mailmap-guodong-xu-v1-1-ee9eff1e57ba@gmail.com/
> ---
>   MAINTAINERS | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9ec290e38b44a..c9d87244c1715 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25119,6 +25119,13 @@ S:	Maintained
>   F:	Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
>   F:	drivers/i2c/busses/i2c-k1.c
>   
> +SPACEMIT RESET CONTROLLER DRIVER
> +M:	Guodong Xu <docular.xu@gmail.com>
> +L:	linux-riscv@lists.infradead.org
> +S:	Maintained
> +F:	drivers/reset/spacemit/
> +F:	include/dt-bindings/reset/spacemit,k3-resets.h
> +
>   SPANISH DOCUMENTATION
>   M:	Carlos Bilbao <carlos.bilbao@kernel.org>
>   R:	Avadhut Naik <avadhut.naik@amd.com>
> 
> ---
> base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
> change-id: 20260601-b4-spacemit-reset-maintainers-4b5a91599585
> 
> Best regards,
> --
> Guodong Xu <docular.xu@gmail.com>
> 

