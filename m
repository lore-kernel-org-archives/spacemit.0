Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CAE2E7167
	for <spacemit@lists.linux.dev>; Wed, 23 Jul 2025 13:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753276228; cv=none; b=tGw38kDrq4j+ixVvQqQSd6JXWX/Op+rWxPLQiV6PWJRaeUbN1VxSCkfJDWOM+HdsDGCB3noq5+f3s+xWDMux2CIUdDbXd76C8szq1G2DVDnC3ShkzDsGQGDnPLO3UUzJ2XPoNlNAnbLQqGJr7UWY0gY3aOqitD79R+G7s7ZZ4bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753276228; c=relaxed/simple;
	bh=vhBAalWa5gqDwmnSu/rBsFgFjTeJbqxDSovXVqBa20A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a3a+NFgYAMqXKXkARayfK3Zgd/Ac7pQshr1x0wxluQEgSH7jwHrVua1qL7699WfP/nUcEPBy103sdYOc1U+DGf4ap9m6H4hhWyFtQ5aZ13RgvQxOrHTqPCKQ1i3OH8Tg8lEKULx1mp94su+K/yrG4xtQtzk/Qa4YFciVU3AROfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=lRKaV+oO; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="lRKaV+oO"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a5257748e1so4029598f8f.2
        for <spacemit@lists.linux.dev>; Wed, 23 Jul 2025 06:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1753276224; x=1753881024; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vhBAalWa5gqDwmnSu/rBsFgFjTeJbqxDSovXVqBa20A=;
        b=lRKaV+oOBoJoCBUMh90gd6NeylamtkguGUH6WI2NVErgcqLuKOOXYcSWhA1eTRbC0g
         euywJytgv4Yx/YIROrgsNk+mEweYnfg6/n35oKGUxvD8TI1SrLMJQTupNzNuzBlViKPc
         vBmHYng3A0EawF+GsOzNnfEtV+xqNXSNobr0KClMrXe4L1TsYa+of4HIE4RXQC/83+sd
         BD6hsI/oMV2vYIJZKYu40fSZ4rid2UUm+TcMndhawFLpI/kpE96VDmzR19LuyFmYiy5y
         vnJJ0RxGzycKXqUhEMvmXp7HLUkCjwk8bbmLRYsWuapzzVBovbcJvFhCUABSh4LQAWKJ
         4ENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753276224; x=1753881024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vhBAalWa5gqDwmnSu/rBsFgFjTeJbqxDSovXVqBa20A=;
        b=HDBzsMEqYKyLqfA6tflxPmqk879w7IQNMfPvYAXVsTO/is4cjmygfaZ4a2oIK7odPX
         FdyrECWFzPYb5dx/ruKK/yaCvjABKUIepLGij5K7q/YHVds+5/8Wwhlwwmtx9w9Gdmkg
         SLXOVkNrCQlIsRMEx2vt1+PsQVngJOAc6TUAwzQdyaj7MNnTIw8htf/mbn8UBCoKWMzy
         RhLoW5+uXv1BeW1VUGcmscgOQJrR9c8JsED/9PGJWsp6+RDT6/EpP+cfVsENcOwc5yrR
         lf4BtwBaJZABqXmxZ6dLOniCzGvKt0akXymDrYqdn36XBMIa9Faor36cvAansjNh1WIc
         W8xw==
X-Forwarded-Encrypted: i=1; AJvYcCVXB+J/xd8LmeU/s00AieTMVMtbBv405Q3cmnXYPeRBIZOMZCC/fXFhNWbznTCI1zhrWl8/9JZ/Jw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzq523bWCl6XOD/67rfxeCOIHwH62KcruGrQDkkThZOYk4X7NDz
	YI6fhmerP4q9uglWWBDSD45buAYpXtL3LaP0CEhREn59OhHdwScLsR8m+LI5egonkb4=
X-Gm-Gg: ASbGnctB4r05QIvlzLnFofjITqhlqeGCi56gmhtfRXEWgUpClFaCbESzePv1tmi+U2D
	dv/cX6rIUSgb+lKWt4ZwJuMte/ogsgPg2Lv+VfLzP0KTe+55jVaLn02Q/7wWY7HlTDPhxqjzTWw
	Y1DSPfllfPd+t2VLtRE4oKG9hTIhDwI3dwmh8EtVoGgXAb/EhVHT1bKBs8IK9nhRPEHmrsN37K0
	bTOSuh2cshOfR2KuNmOs7nXy3VhwOV0j1yW7RKk/QW3kh5wp7ONjbjq3KPV1YPovmZgeqQlzA7y
	30L4IJ4fWIeHohLdTX1SSe0jKKzlkno4CWIukLgF8y/1ubSUiO0nWiBbC3z/zfrHTcitnxCz4KQ
	a6V9x/SA1T4JDG6lMeLrgUpJkWpaky0I1zcF9/cVytXiF/0fIKVVoCf08zHTCcuKnBBfS+P+S3V
	VthdZY8Z/gFQOF
X-Google-Smtp-Source: AGHT+IHaikAjtXSOK7TzkgieFuqf48w0q0zzAkHwiGU+rMcHAorrKzxT8fl3tGpNBEzEAzrmfTi+OA==
X-Received: by 2002:a05:6000:40da:b0:3a4:eae1:a79f with SMTP id ffacd0b85a97d-3b768ef3c90mr2447676f8f.33.1753276224129;
        Wed, 23 Jul 2025 06:10:24 -0700 (PDT)
Received: from ?IPV6:2a02:1807:2a00:3400:7fcb:5e01:8f11:1009? ([2a02:1807:2a00:3400:7fcb:5e01:8f11:1009])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca5c813sm16511400f8f.84.2025.07.23.06.10.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 06:10:23 -0700 (PDT)
Message-ID: <fd4eba94-50f5-46c9-8675-cc0aaa4601c6@hammernet.be>
Date: Wed, 23 Jul 2025 15:10:22 +0200
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: spacemit: fix resource leak in
 spacemit_ccu_reset_register
To: Yixun Lan <dlan@gentoo.org>
Cc: sboyd@kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250723124020.60897-1-hendrik.hamerlinck@hammernet.be>
 <20250723125416-GYA738759@gentoo>
Content-Language: en-US
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
In-Reply-To: <20250723125416-GYA738759@gentoo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello Yixun,

Thank you for the review.

On 7/23/25 14:54, Yixun Lan wrote:
>> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
>> Fixes: 988543522ebd ("clk: spacemit: set up reset auxiliary devices")
> Can you put Fixes tag before SoB? I'd suggest to follow tip tree's docs
>
> https://docs.kernel.org/process/maintainer-tip.html
> 4.2.6. Ordering of commit tags
>
> otherwise, looks good
Thanks for pointing that out. I'll send the corrected version in the v2
and make sure to follow the guidelines in the future.
>
> Reviewed-by: Yixun Lan <dlan@gentoo.org>

