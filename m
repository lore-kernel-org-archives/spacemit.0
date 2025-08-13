Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0882E613D
	for <spacemit@lists.linux.dev>; Wed, 13 Aug 2025 13:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755092061; cv=none; b=AGXfu3Aebh6mpTaWpm4FIndmCqVTdtD145JmXNqBIY6Jrv9JOCTvn8RR6cVUhfkEvkxS5wm6uzRvmKUUYDpM0936/Iz7EcRwsmX6kSFnch+a7FxZlp0aPEgjQyZqTxuEbdRJcRs/nGD8CDJs3JO1/dWwd2UQOLUxpaIE8GmL7yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755092061; c=relaxed/simple;
	bh=fNSC8w8HU0S89hQRnFJWFWREK6fXZjS72GfrRn4HArw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bRwNNKcTVT0PmwwvrEvuMdCts+GwcxPaamIbl/wCChEc07KIEn8LtoFsG1CJn4pgncIlnve5ahh82VWHymzBqnxFCqfL7tNmJeIoblCdcNV7ttZ/xHAd8tw67rT4bMnYBI38DKf8tlfs919XgXr53/5MAKgiIObgxyGZe5iqb9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=UUIpmZp3; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="UUIpmZp3"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3b792b0b829so6607158f8f.3
        for <spacemit@lists.linux.dev>; Wed, 13 Aug 2025 06:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1755092056; x=1755696856; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fNSC8w8HU0S89hQRnFJWFWREK6fXZjS72GfrRn4HArw=;
        b=UUIpmZp3LC8MqkkNH9fX2GTGofFsPqzzs9oKJTKO2OpSxSE05omY6CR9IL6XtGEPo+
         qfUz/d0KLrhHv/DGglurL8Ryvu/QSXEsPW77jDkXzZUvvEXEhD7Cxb4bIi8SsXVTb63n
         Egs6w4s8f7qPQD262sVU9drKHzJbaebboIa5udDoohwbjSUDObPOB6ostiAseifw86Fk
         B5pQqDNs+lK06sNcdCAKHzZnxlU7O5N4R6dfmE+//wkAYYEu5z/seqfpEY0Ib55nyRBu
         yhhE2/6g3LK5mNQ69XM/1HpjzUW6vl6gBKslrYx1ZW2K7riwpJks+JofIMKQV6X0MCjD
         sxCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755092056; x=1755696856;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fNSC8w8HU0S89hQRnFJWFWREK6fXZjS72GfrRn4HArw=;
        b=p70GtWO6rLSC1g0TdLHR0nW4gvHSgLEWIKH/hmTNNtaME9F7fArlYrloTdT4oBcmWU
         h3J9x5iXI3x5SXdgZtYVmDeR738laEzhot2vrxJtJrwCzgTIa/xtf5Qyxz+W9wP+PbGm
         Rh0AVg/SAt6ED/ytqNkYRE4CcLvTy4iAV6cjlVbx98CEdHUQF8djVwMLezQiRQbvF6t/
         HNXdGmiVO3f2A5WYsexFlEZz+fG0iJ57LxcStIlZVlvHjtq0ur8EsO3s207ufh4/cdJ0
         kjN2ZlrizciIXU01qrOGW9PLnFw48esJCj67x9kl9muOMaVFqow30i78t7qZKcTBd62a
         sfiw==
X-Forwarded-Encrypted: i=1; AJvYcCVee7yx0AiAjNAV9uJ7Oze13+cE3cVxkvlf8mzVCyfiiKPgqsMMeMjR0LplQjMekaxXG1nebmFdBw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4DmhFTrtgMLbmIxDL0HGRCwUP7YskAxsMIXqilxsFiOB0+0LH
	6B13ol2AS5GUM+cxP7PxIZwgskqITvzAiGDNF26gH0Y/p4XDfMyqNgN7xbwb+UrSFTQ=
X-Gm-Gg: ASbGnct4of2tbDYG5zRzxzpoS/+J7oLmDKzrODWyWA48lpxYxdya+xqKJUT3uHHNiaI
	B5lFD/F3MZTzScFLJqgHad6bREdwi8QDZGIa7oxPWfhtSVJqQ2QBRIKy1JQi0Ja0OUD+FxD3SCq
	zaIMiY4YuAxjf1Sl1SYM3gAudmLtVPuaEwhBH/8iB/QdN4WXiNn3bM33AQOnvJf8hlem71afMdj
	N17/VeBJWdafGQFgTL2BJjWWtW/Z7zeRH2Df/xL0dUckWkKh8XliZp1GRP22iEks1DYP0cOSFIS
	CJDWFzb9O5/7mkxLHp6LVg1ykO9jsSahNuYgIWhoEoKNmVs0qLdV1dwZseMuJZxaXdsyVJxhLk5
	Uc6qS/dHU22YWjMFQ/Ge5jpEL+aAFv9pTWyECAxwi7+UIMJLayDRFci4sTfILt3b3nINVVsUlMC
	ssQmRX9EAYufO6N+LV+BBd
X-Google-Smtp-Source: AGHT+IGyWBRLcYyjmPdaFJ7RJMvGFJChrNnUkFexYqA+15BorH+hR4bUKBZZRC1EER2gmnrpcLdyVA==
X-Received: by 2002:a05:6000:26c9:b0:3b8:ff3b:6437 with SMTP id ffacd0b85a97d-3b917c85890mr2243633f8f.0.1755092055765;
        Wed, 13 Aug 2025 06:34:15 -0700 (PDT)
Received: from ?IPV6:2a02:1807:2a00:3400:388a:2f48:ed4:7e0e? ([2a02:1807:2a00:3400:388a:2f48:ed4:7e0e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8e0846777sm37944948f8f.48.2025.08.13.06.34.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 06:34:15 -0700 (PDT)
Message-ID: <463dcfa3-152e-4a48-9821-debdc29c89b2@hammernet.be>
Date: Wed, 13 Aug 2025 15:34:13 +0200
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 4/5] riscv: dts: spacemit: Add Ethernet
 support for BPI-F3
To: Vivian Wang <wangruikang@iscas.ac.cn>, Andrew Lunn
 <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Vivian Wang <uwu@dram.page>, Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Junhui Liu <junhui.liu@pigmoral.tech>, Simon Horman <horms@kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250812-net-k1-emac-v5-0-dd17c4905f49@iscas.ac.cn>
 <20250812-net-k1-emac-v5-4-dd17c4905f49@iscas.ac.cn>
Content-Language: en-US
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
In-Reply-To: <20250812-net-k1-emac-v5-4-dd17c4905f49@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/12/25 04:02, Vivian Wang wrote:
> Banana Pi BPI-F3 uses an RGMII PHY for each port and uses GPIO for PHY
> reset.
>
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
>
Tested on Banana Pi BPI-F3 and Orange Pi RV2. Verified SSH shell over eth0
and eth1 interfaces, and basic UDP connectivity using iperf3. Thank you!

Tested-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>

Kind regards,
Hendrik
