Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5796649E5C9
	for <spacemit@lists.linux.dev>; Thu, 15 Oct 2026 12:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792066557; cv=none; b=cNTpaBthUq4OHIAI+xjCD3ExnKud59hPSV2coWb4JGRytJv8keT/AW8WNDgrEK3FaVlha48C8Zca7r92X7tFDboJrhd1EXHxRaLKOFBj5vzdxq8fv2ylhXsu2mzT6opWhp7gHt1Br9roOga+zxKUEb51necSiULtu0w/Tj+soPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792066557; c=relaxed/simple;
	bh=6oVcdzmMK85KNvYQY8vkwxZflX80T2BxPJ9HHlrFwhA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KOpaugMkqhW/HMMy/w+4kVzdNoRjHbeDqzoY/kBjy3dA3wJCkIYBq1atT3fq06mc7H9AQAkSu5SlwKIMMnFcIvmkqG4q2XvzvMtwsZ0SI1V+7+jOT9u2MezEf8sauAFEiWXUByoomNQHLQHNlPLxGixzXiToyUReghx3tYVh7Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kk5ZcE4n; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kk5ZcE4n"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so361319a91.1
        for <spacemit@lists.linux.dev>; Thu, 15 Oct 2026 05:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792066556; x=1792671356; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SN6vSgMsnnJYN+HFBZesKCHrB6GOW3IUndONKHtHc6k=;
        b=Kk5ZcE4nDsl1tv548rKKSek0rPgRlA27suipumTqwEWygd8zouLuUf9YjnU8uTyHh8
         SxQPf8jU6XE2E/zQfI6bgT/Pfs48pNOM9LvZsN56mIepr4q540AQdyv28zbx2Z1zevUX
         4CIndJcHdUMwaW27H93t6wdhWmmldFXIyUjXhWkiIeF85UtfFsNZoCYGDKAx4Epk09MW
         SACPo5hd9VZ4renDJplAPxHc/kj+plVzrBn9RRm6roUPxZ21awvvFLmmgKbdy83h8UVE
         VFIXTdUyEqPJkwLocXfWpApEHjs6T47rsUKGnwy67RgLVxLT0u5XhxPmK8wM3rFO9IDb
         8Crg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792066556; x=1792671356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SN6vSgMsnnJYN+HFBZesKCHrB6GOW3IUndONKHtHc6k=;
        b=rYQbQki6/z/qpo+0uVtf/15WsHBFQlsYLVGLM+ySglNhbtEd6dho6U9RvoHC7J/KYY
         j7V6qVUIztuTSySP2nPj993asfOsbQL0CaRUWhPJh29KZSlvbpB34zWpRWJg2SSJ5eb+
         2vAiXR06xF/GJU9NBSoPEM5PM9MMZ+U5Rk7bK/w70WQRHPbCloAIKc90iS8CV3KLoq1A
         o3rfSulHsSOcGdN0EbTtl/McUtf45J51aAP4IQlxWoc5ub3TDaoKcClUmo0O+zhyBlno
         8VxIOI0dkh1YT7d5BF6wE8G6yMApIgIPlCMd27eyq9dHQvHKwWLV3GhydmSsRszvQcgl
         cbnA==
X-Forwarded-Encrypted: i=1; AKwUvBy5hzlNt3h3+n2Q/RaiHX59e5Umu27zKyjO2KnMTKUwWgeg0lzbErb6l6yxTCi1ohucAFqmsq/8gA==@lists.linux.dev
X-Gm-Message-State: AFq9FYIcZIgAdQ06HH4b4NGBw6oi6DWZV1EX2Qo//pq3emiJieiX3QJs
	0kb3NOM1dDaVo8xjB4rOYNua8RCcGGbdVfgB2ybyTV0DOzte4QiH4A6p
X-Gm-Gg: AYBFou22WCer6OnXX3Qc7GykSFNZ6wis0eXvtsNJvHfi0aGQA/uCfVsrLM56BeujsEG
	XivFA9H+QP8nvBkzqobhg5E9m1MdgT6KjO/QXtiFzOQJ3En6Ksw5Q6Ng7vUBYwSrGCTwRdDUWsV
	nJE/n6A7IxXt/wo77vK1B/ribmF1R/a0P5qOJ++iY/Bdwvthk1bcdCAF2lQcntLFXBR8e11jfhS
	UVeYKohCrjTInhHOMEAAHoh1+PFOFLQfNsGrrHGaDz9k/huVpWKjYpcggP5q/fRkQRbFPYcwCas
	XiHRtaKy/fSAgPwQs7zHlTrkTvPmCuL0EB1IaTfXqsb2eBU8EOk1+lcwuN8St2Iq8ke8jVb9nVw
	TWnZ5rzLiwtioEdTgVuol5ctRPS7j3H/+jz5UeTSeHRLOHKp3zyU1gMX6hc8SU4PE5SsjWUxrG+
	P3GEahJI8sKEv71IP4yz85DudKxVlyCh/WJ9CmxnbWE1iaVTvw3lOvEj3mnEbycRA+I5rRYhm1W
	zBPxVBHoFsXPVeTJ66XfEcEtxm7aXQQZ9ADFXxiEcVOb5UYJ4z/UPH6RUq6jcEkOhjiIwisctkA
	cjlwOLQjXP1NRpNdYN/qT1mR3g0jL1uIQ+26ORC6dNNuzI9g13NKVg==
X-Received: by 2002:a17:90b:5825:b0:3ac:9ed8:f301 with SMTP id 98e67ed59e1d1-3ac9ed8f5eemr1065524a91.30.1792066555611;
        Thu, 15 Oct 2026 05:15:55 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac9437aa5fsm4273307a91.3.2026.10.15.05.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:15:54 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	E Shattow <e@freeshell.de>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: mark K1 board boot devices bootph-pre-ram
Date: Thu, 15 Oct 2026 20:15:49 +0800
Message-ID: <20261015121549.3809199-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015074621-GKN26088@kernel.org>
References: <20261012235624.77993-1-alan.tseng.cs@gmail.com> <20261012235624.77993-3-alan.tseng.cs@gmail.com> <20261015074621-GKN26088@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Yixun,

Thanks for the review.

On Thu, Oct 15, 2026 at 07:46:21AM +0000, Yixun Lan wrote:
> > &i2c8 {
> > +	bootph-pre-ram;
> We could move this to dtsi file, since all board share
> same design which use i2c8 for connecting to pmic, the
> reward would be that we no longer need to carry this
> property all over board dts file.. similar we could do
> for "i2c2", but I noticed k1-orangepi-rv2/r2s have no
> eeprom enabled..

Agreed, v2 will tag i2c8 in k1.dtsi. I'll keep i2c2 in the board
files, as the OrangePi RV2 and R2S have no EEPROM.

> > 			buck1 {
> > +				bootph-pre-ram;
> U-Boot also carry "regulator-name" for this node, we
> probably could also merge it here, but could do it in
> another patch if want to limit this patch to "pre-ram"
> change only

I'd prefer a separate patch for that, to keep this one about the
bootph tags. The U-Boot K1 SPL looks the rails up by name ("vdd_core",
"vdd_1v8", "vdd_1v8_mmc"), so once the names are upstream, U-Boot can
drop the overrides in its -u-boot.dtsi files.

Thanks,
Hung-Chun
