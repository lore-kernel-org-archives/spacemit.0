Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56247378D79
	for <spacemit@lists.linux.dev>; Sat, 28 Mar 2026 09:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774691221; cv=none; b=ETwfhn7/lc9ONWM7rVUOInVtXfmzL23yDngKA4Fw/8Ee52BR1fTvwGZ4hKXQMH0EtRJ7CKrVFtIRqKZeJdSrBydHfarm7U+ioA/ZNQvDoLeY9MsKVy4EbJPdJz2huHcW4LR+F1S7/pk30W/d3922uXe8KgchZJukDDF5TaK5iA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774691221; c=relaxed/simple;
	bh=Mug/7k7yiQUruxGBnY8AYdjOaizJTDak/1tlC45nw+M=;
	h=From:Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:To:
	 References:In-Reply-To; b=OiiCU7h0dM6QQxdnxhOy/6hKYFRtyrdvbKeAthsoZXS/v5e0yLvYYqypEuUUYRH4ePR7k+4FrSyl9zhGZjbqakSqhXvkum4+8mdP4mE7vhsJdAe89Ge3YJsXvAzqkzgFK3iggMkrktux+ORmIdTCIditGau2ZhMXnEdIK3VIFfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o4bHBhDX; arc=none smtp.client-ip=74.125.82.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o4bHBhDX"
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-128e4d0cc48so3592596c88.1
        for <spacemit@lists.linux.dev>; Sat, 28 Mar 2026 02:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774691218; x=1775296018; darn=lists.linux.dev;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mm84PKI95ws94X4le7u52sogEFGb/3XJpC4WJ7nzO9w=;
        b=o4bHBhDXlv2kfr98nIBd/eo65nwrVq3r82YWjC/TBXlrbOGKRQoNPwo1GnduL2flkr
         yOVHfLD6Ibw1TQMqnwXhRnEKkgeBgaeG9R+1ErvNmdk8zyonFm0/lz+ym4NRXZ8NQLJy
         IfVHlyB0TnlJz6F4Sfkowv7Ps3pm6eshdP19gQEEWW0H267iLaaZuNURpA1+YwpkS7l0
         AdZUpBQ44guetbxF7OP9bcLMV6ULsfAXZZQPW4p3NdF2M2K6dI03gV1+r7zAXdGm6t/Y
         bblsTK7bxJFA5lxIU0IJ5uIj9OO44ONAX7dfXfdQGcdtrEZjB8osLtMKDx0WE5iYOqSY
         GepQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774691218; x=1775296018;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mm84PKI95ws94X4le7u52sogEFGb/3XJpC4WJ7nzO9w=;
        b=bzFNrMa4aPnDlgSfyaEoQhHfvgW9IsT/EbJaH5EBGX2XqgRUboQ05GoA9o8hu5I2JC
         kcIzotkmVA/SKt3fux9vtzUslUodq4igG+pMB0ApmZE4Q63T2dHB81ITLAC3wuJO9W3s
         SdJ1YmEbrpgsG9q++OQwZWQB22rxpSNbYRcVpOOJCwGcUs1wqVysCy7D/kceoKEWAgyV
         Om65a5s1mHSefhAqKKEECAkopUfJ8rxuXMjHPOvWzJd5xjTtJV0k4eWSlCHnRKHfkuzq
         rOg7jflY4fMCB74WWsE6NR46l9hPTqdB7l2XBxXXA+/mYQ47ATwfpf8Rj7Uf241kLskZ
         am5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWemEHqdhXGLkhDF5+QmGNFzm7Ir6SA9DB3UAKXb4zZ0eTYfeFaf85qbRWnMVCJs/JDo9QcwuTM8g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxc2/2VaWriMJ019iZ1eCX6X2XZ6bD7hOaJPMwZ9kp1iGNWoNtG
	UtCM1T4jX4crliinLPicxuIjBeZbTTDfmaiIwxSfF0oP8BwYdG4TBDfR
X-Gm-Gg: ATEYQzxNR3407J62BXmAE9La4lgtZN3lIjFr2hpZRJeFoG55sg8FsfMq9DftGtxSoeA
	otMA1FGLdJAW2/cL9wfzkclGQ7hD5Y/drLuJCIrwxoEqq7YJCoMfsXpIOyQ42b6hVElq9kH4i4P
	IwxuMU1xT9GflQV6Gyi/VcNt6KwI2ssm4TBdQXqKOU8Kg+RJY82/ArxQ/vJJZIz7caK4FwkucI9
	8ko9aVznwxLgjj8DiizPtPbEfyNzyBUh9AOG0bk35ua0HCIk/Q/Dxz01e1uo4Xqwd6BkEhhoXHb
	HVxBzhAmpjAgYJqGtoU4QrVE1PWq56kMpdy3DCbFIiI5O3w2akNIQnIbcFcv/Y7rZL+1bCAX4nG
	s+g4ssV77mg+v3oPCU1fghl9LfDvkeewA03xFq+iv0ck6CriUDQkF+jDUR8QpQhOIfgE2mUsPEB
	efAZH+eCHcrS8uMe6A4Z5F0n2iqsvKo8YpqY2ABA==
X-Received: by 2002:a05:7022:6085:b0:123:345b:ba05 with SMTP id a92af1059eb24-12ab28cb38cmr3135449c88.22.1774691218233;
        Sat, 28 Mar 2026 02:46:58 -0700 (PDT)
Received: from localhost ([104.28.227.186])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12aba581027sm1773856c88.4.2026.03.28.02.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 02:46:57 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
X-Google-Original-From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Mar 2026 17:46:54 +0800
Message-Id: <DHEBJ4VVDDY2.2KRIW6EP7EXOL@linux.spacemit.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan"
 <dlan@kernel.org>, "Vinod Koul" <vkoul@kernel.org>, "Frank Li"
 <Frank.Li@kernel.org>, "Guodong Xu" <guodong@riscstar.com>, "Michael
 Turquette" <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <dmaengine@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v2 1/7] dt-bindings: dmaengine: Add SpacemiT K1 DMA
 request definitions
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260326-k3-pdma-v2-0-ca94ca7bb595@linux.spacemit.com>
 <20260326-k3-pdma-v2-1-ca94ca7bb595@linux.spacemit.com>
 <20260327-fancy-nondescript-mouse-cfd6f3@quoll>
In-Reply-To: <20260327-fancy-nondescript-mouse-cfd6f3@quoll>

On Fri Mar 27, 2026 at 3:27 PM CST, Krzysztof Kozlowski wrote:
> On Thu, Mar 26, 2026 at 04:17:16PM +0800, Troy Mitchell wrote:
>> From: Guodong Xu <guodong@riscstar.com>
>>=20
>> Add the DMA request numbers for non-secure peripherals of the K1 SoC
>> from SpacemiT.
>>=20
>> Signed-off-by: Guodong Xu <guodong@riscstar.com>
>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>> ---
>
> No changelog - neither here, nor in commit msg.
My apologies, patches 1-6 were added in v2.
I missed including this in the version history..

>
>>  include/dt-bindings/dma/k1-pdma.h | 56 ++++++++++++++++++++++++++++++++=
+++++++
>
> So previous review applies, no? Was there such?
No, since it's a new addition, there are naturally no previous reviews.

                            - Troy
