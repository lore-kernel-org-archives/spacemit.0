Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63788309EE5
	for <spacemit@lists.linux.dev>; Tue,  6 Jan 2026 12:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767703012; cv=none; b=pDOx6LGtoiYj8da6bMWB/LLUfsD/Q6RoOGjoFSbGIO+B7KRBTU0XRJThrpNpECNGUyyp8GP50T5ixaQUTE/O3FBGmAkX5rcq4V6OrKw2cdOSbrad8GsVYhohuIotGymCICQzg+ktfVyoYZCu7vRGw01OmkgS9gTF/e+8KDAGzXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767703012; c=relaxed/simple;
	bh=nbxSbu3nNELHHaWQFLTKfq0RQnQb8K45axVnhsVUdMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lO/xgCPvlvCQHmhMg+ObnWDo6a+FPbeMItGe7jDkZ4aEBBLa208c2H3grdjy5+0oWp16LMZUbccVfuM9s228bS4LmodWfk24nLInypKpS8GQNWBlH0HCJGFrvNPDDhZJ/jypQaWyiAS7yz4Ibb1iVF698hzQNXizir1RO/yrNMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LHfY6ROv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RPyiEHe8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LHfY6ROv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RPyiEHe8"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606B7t0V2253728
	for <spacemit@lists.linux.dev>; Tue, 6 Jan 2026 12:36:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aFdsrGyQzvH3//bxJ/J7dg4vdFiIDNfK+TRRwe0c26E=; b=LHfY6ROv72NXf4Ix
	BM1LBq/DXviimD3ArWildiNn/cqwURog0HoDfMzQRh70ugKImKOKJ7n77m6mxN9k
	LBh/VVg+K2o4CMx/LOF//MsyIgQvAWg0yzt0v9eu4u7/PMe6u0yl3pV4bCsSdW8w
	ZpvBiMSeVEePssN64WYKBmbKfM/yO9iQ+8HAck57Z3JWjY+FcFOaV1FAGIJrRjAB
	VChlXrIrwZwZpFfIarxV9GZC/mGcUTbxWLy9jE5TTM8n7Olxwfnjhz7ROFOCyaFz
	wQnjDvxH9OLP9DYBkcQaEXfg6lMYH+NnvitjQOEkkn4Uigq0xysh/Thz1db1Mslr
	7QhZrw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgu421c20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <spacemit@lists.linux.dev>; Tue, 06 Jan 2026 12:36:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee09693109so18353261cf.3
        for <spacemit@lists.linux.dev>; Tue, 06 Jan 2026 04:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767703008; x=1768307808; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFdsrGyQzvH3//bxJ/J7dg4vdFiIDNfK+TRRwe0c26E=;
        b=RPyiEHe8OBqhP1Bnm/KIIKEbypZaJZ+txt1Qs0wvUKDasR1cU8VxscyVw0iystYYxh
         wnbc2XvVIbwYg3Co6ZRxZYB1E/mu5syGCBIvTD7n7ajqNobS2YRbp8Ly4NWj0Alg4nyG
         3wOknsNskgZfGGKNkodJ07l1fwayXXTSiuXng/3Y457swDgfDG8EVX1lnlChk41QBksc
         EurP2+4oT303D5hX9wqwlkmhAQ49CT/vhn4PEWf7/dVLtGDrFpIapBpl5pKjUkv4Vm5C
         lUurvucfOnnj9f2V/p5YPv+zhi7CMlR+alLFib7MXtf9kJfm7S0o/mscrxN0Mrj2DO+4
         FeIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767703008; x=1768307808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aFdsrGyQzvH3//bxJ/J7dg4vdFiIDNfK+TRRwe0c26E=;
        b=F5knpH3hVVTTTgNWQj4DDgfl09uV2f5jO3TMz5SIZzjp3Coj/Dbz7LLc6k6ZzFpJmq
         TzyleUTYQZ7Edl5eIKLc8RP0kTp68fkbi2oVKS0VAlZ9S7V7PAm5MnXyVeScY71ktAcy
         d5ESdOBmU/YBnckWuViwwJiGefhV5HCjwIGF+LOZzaeB9fHSKanrO5te1IaPVuCNQxno
         o2RRUF8tnwPFjrmtaSG9Ftciau9FV2b+BZzSe/k0NUmQym3JX1D6P4PRbSI0cJPHacCR
         m/ZM5faLAEx/0eF1KtAH4sZxrYudC8/Nwt/lyYyulS2CaliAzjtR24QxP/gR5YpF0xkp
         Vucw==
X-Forwarded-Encrypted: i=1; AJvYcCUhMMBXsgqhckhc31XCVkeXgz+4r+AT55YHAklYB5wsHM4FXiDrGmiujqaw5U/F5Gj7dxVwHUTHMg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwHHml9w6iTmNxaIuknpQOZfD4i8LGEWczMLjwoFrWklEfN8z0s
	MThcYTSQt1UGQ9Ifg0Md9T+N26J4bC/V5N+tlqYrEsidiLC3FHvXc/6khyepDls6eHUdxKR4Q0w
	TUDx/Qq7lSBZYpOpQhOHdvzlUaQcSKjIYaZhcOOw45OxS2kj7xokO7WNkl/XfaQ==
X-Gm-Gg: AY/fxX4KUZF9lTrZjQGYz5Rm7Zb+gLbxbATvW8GFwOar8A5wcWn04qm+p52Urv7Hhd+
	ypfKWCwcaQXEw3fbAO7pIXBsi0nSJQeYfdcKbd2fVfCMZhl5q+khGsaJbr9Qm5KvzHBFdvSlWO7
	CoxlmnDvNFJNPOn6ZoL0H4r24Ged4ojqzA1B/RcwwHeppJKA9Fi7gtYfBw5+qbpJ32KVDTNEN5V
	nBZRsWWq0KmGCv2G1DRGBKryM7Szj1I7FNwsgegE4wqLjUZ/WdzO3q8NpnyoZJi7+6G/kpQKxwN
	GE9nU2bD2KWoAgU4BhsS4qkRudZX9ldJhS7qJ/A0v/1/ssl6MCSYLohXS/k6bK7FwVIdSIBWkah
	g0kRtI5HE9SBLv4iAVq4s3VR7J2/2FppZ+zIMlhU=
X-Received: by 2002:a05:622a:1baa:b0:4ee:1875:42fa with SMTP id d75a77b69052e-4ffa769aa45mr32669251cf.1.1767703008380;
        Tue, 06 Jan 2026 04:36:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3OlX/lVZ9eRQ3aOxiW51OeVVVBJf12PTSv0Qtj2HDqO8JCJLlFXFtDil0tgcdGIzjsiK6SA==
X-Received: by 2002:a05:622a:1baa:b0:4ee:1875:42fa with SMTP id d75a77b69052e-4ffa769aa45mr32669031cf.1.1767703007978;
        Tue, 06 Jan 2026 04:36:47 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:3980:9f91:8651:f23b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f68f686sm40728415e9.3.2026.01.06.04.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 04:36:47 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/2] riscv: spacemit: add gpio support for K3 SoC
Date: Tue,  6 Jan 2026 13:36:45 +0100
Message-ID: <176770300365.41755.2635230320486109502.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260106-02-k3-gpio-v3-0-4800c214810b@gentoo.org>
References: <20260106-02-k3-gpio-v3-0-4800c214810b@gentoo.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dYuNHHXe c=1 sm=1 tr=0 ts=695d01e1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=aIeBnXaUYv87OnBSPw0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: LljKcLCxK2ix9hllzQ2ONVJn-rMkse2v
X-Proofpoint-ORIG-GUID: LljKcLCxK2ix9hllzQ2ONVJn-rMkse2v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDEwOSBTYWx0ZWRfX3fmua0cBrUVg
 uYD8Wik2Krh3fJVfo2Z6z9lv5zmCog/VAIM/2jmb5qeQQ1GhyWLQB9BxqOJ2q77o2/tGq9u66e5
 vV6pL3Ys4CNI5JEkqIqws1DUeLSiyTAM5BzjMh9YrPSRG4uu+PR0CxcHozH410JWMApAkZw8rQV
 x0bXBPp1OweUrdKzI2ILifzAr94fHKfEyhI+7tNu1Lc7rdpwNc09VkewSK4y9YeHcaFs8XlBLoJ
 afTUO8rHwDCZazyQOLWLEtsNZF/P4dYzIrq+V9pqV+QXHx7CXTjLuTrlQLHag63vb6r2O7TldzF
 q4L5AVYcZJDmbsppbOrclHDFhIfWHoxjZMjPogVROzvxeJPx+u5VWy2cubPohWjt9PaIezBuEVc
 IyyfPs/Dxb3xuo67s4eVSa7qGMm22vm12L19XuCc4t9NlW6qOntNY+rcO8P9hUJQ2fLr7YGdZFg
 nr5xp6JI8+eC3Evhf2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 clxscore=1011 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060109


On Tue, 06 Jan 2026 11:09:31 +0800, Yixun Lan wrote:
> Introduce gpio support for SpacemiT K3 SoC, the gpio controller
> changes its register layout and bank offset, while mostly shares
> other IP logic, so adjust the driver to support this.
> 
> 

Applied, thanks!

[1/2] dt-bindings: gpio: spacemit: add compatible name for K3 SoC
      commit: 48033e4c677be4e3f131df454d44a5d1fb1b334f
[2/2] gpio: spacemit: Add GPIO support for K3 SoC
      commit: da64eb51595bc6073b2fb69c2a3859bba93ed75a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
