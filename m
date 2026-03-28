Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B902D7DC4
	for <spacemit@lists.linux.dev>; Sat, 28 Mar 2026 09:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774691309; cv=none; b=g1ZzeSPmUONzqO3/jttHBULAKW8qc4YVEQOngSdsxeU3UFxuyjdvgQc4pgfNpztvLiWJ2yR4kIB8tjmj6et+0ct8rV+O/n+i1SFveB5leXB7oZJHJCaPFsanzttvXks6ILQKhG+3Zb/UXd6YEE0J//1SJtbVQcu/Vi98JrOcYa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774691309; c=relaxed/simple;
	bh=H0NsGRh1ZLqqimD4Zi9vPUYMg9ZH77e8pUdX2q1gGgY=;
	h=From:Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:To:
	 References:In-Reply-To; b=b16TTJlW7pdfRZ3KlKX4sdiPMDL24+tjjQWj+U2wCmYeNhXLa7RiPTFHV62OSrVDh5Y2b9+XsjCJ2/U8RJj/fZpUHzkhwFb5nkzILw28bX6btsItDZ+5uyLyLWo2BjBmi7SPdtMv6K1PABhNfcrNE5QwN1W6fnNzAaZkKM79BEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MBa3nWpm; arc=none smtp.client-ip=74.125.82.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MBa3nWpm"
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso1855559eec.0
        for <spacemit@lists.linux.dev>; Sat, 28 Mar 2026 02:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774691308; x=1775296108; darn=lists.linux.dev;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tRlWsjp96tD6U6Z/Cd/j4p1pGmRJaWjFo7e47fa1C/A=;
        b=MBa3nWpmJUhHcspkmH/2z9yv2nWryU6kJoocZHy6iAFOiX0cI4XxLFPvoZbYvOzB2D
         we5stHcYf9VUXyVCHMQqVMqWO4875lQ72dhzBet2De50e48A1tfBJkpghYgiq3AU1tOA
         86ErTcwmWPAKNT7XAJ5k4h3jHd5Gm5LbGxFEnaRBVMcKdp3v6QkWL7H/ygN+qYKp2uKn
         oFbpIY5iZgUFo7dMPXnpddmopdeYrDAtq1DZl3Fb3K9Lgs+onFaaNG9nr3nzxVqxwZH6
         j3DyFb0aVRD2/y2uefCJAs+A9GteiSeEsXkznYbDzzPp7LYjI/3DVWGr5mbQASv0iLVI
         PDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774691308; x=1775296108;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tRlWsjp96tD6U6Z/Cd/j4p1pGmRJaWjFo7e47fa1C/A=;
        b=WV+MrQ3S0cWKmCIXsIYhOizIrKhS4YaGKnwVfAA0/OYly3RTnF0zMhZ8AvcvruLvzV
         0yWFFdqAGW8fwv9ZnaP4xt+2axbcFGL+MWw3g6D3nNQdEOhK0x4dcUlfkbsr5yoSg58d
         7ND0BiwsLSM2VBoHHVhrNEZKlnIhgcB6tBR5AQAypM6dD8roHx1e+lSVLrhlvui1zNLb
         +OSBcihuuEjBjKciTQUa3tmJ5cu5ErKp/dvNLedscbSqNCjF+EPjQCoLJ4yVkFFK+y/B
         gLH3rT/qqMH9ycjinqZowc8opiQKUKKB4T3K3HyKe0WiDlsUUoBDJ31daXbJPMj4yirV
         LjHA==
X-Forwarded-Encrypted: i=1; AJvYcCUa+ipy3o0/+aFTb4CvkeqGvmLqOfdcUmxhhsJC5gM0Ukq+2xm8xLLsAIYMeXjyuAMapVCi420TuA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzzBWE/oRQcu408ajoUqHz0CoccHfvLWo+TZLrt7kpPmKS05DUd
	F1yp9XnIY9VvxAzIWbid1YI3iXEdeT9C3mUBhi2qY8UEPKaDome8WQav
X-Gm-Gg: ATEYQzwChZ51fEdMCSewU22K+MoaZRLg8xkwIOE9qAzMlk+E2nFOSd4jm1KHP0j8Q5o
	TYUAAOqh/fB4hM2Jbwfjds8b6uV6gAxjMj9tnIS4tG5UpFNIeNOj88EZ/O2yyh2C1Yoj4aRE9kJ
	wBD1PowDlJ/EA8H/wq+ZlldyYPspIE6UJFg1wMk7V5NFM99C0S9ShFp2x/+AzRWacoW3tY1tVX8
	VWQ2pq5TlYo9VG27XGvy9yeJ9/HDW/TBwPeF1uTdc9oD+JE3U9U/+LQtdMbHJQOFWRkO9royUqJ
	0MKJF0DgNBryPrCwJnuxkFrmYnRAvAKh+2HpD+4odmJ2KO3As0UflMfyN5VPU3P605TQ83rL1dB
	7KalHwSn6plabDPE9FW0IJNNRUxpyzQVCl8iP7q7hRrGvIBwFvjLN47znqsy7W70hXCevvNpaBC
	g0GkhxAA/4KXyKHfRmoCyztoYtrh0=
X-Received: by 2002:a05:7300:fb8b:b0:2be:9c19:b34b with SMTP id 5a478bee46e88-2c186dd2a0amr2428508eec.4.1774691307454;
        Sat, 28 Mar 2026 02:48:27 -0700 (PDT)
Received: from localhost ([104.28.227.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c3bda147sm1742844eec.5.2026.03.28.02.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 02:48:26 -0700 (PDT)
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
Date: Sat, 28 Mar 2026 17:48:24 +0800
Message-Id: <DHEBKA3QHPUT.2A9BJLPBXGQWG@linux.spacemit.com>
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
 <20260327-silkworm-of-algebraic-aurora-e9bd1c@quoll>
In-Reply-To: <20260327-silkworm-of-algebraic-aurora-e9bd1c@quoll>

On Fri Mar 27, 2026 at 3:28 PM CST, Krzysztof Kozlowski wrote:
> On Thu, Mar 26, 2026 at 04:17:16PM +0800, Troy Mitchell wrote:
>> From: Guodong Xu <guodong@riscstar.com>
>>=20
>> Add the DMA request numbers for non-secure peripherals of the K1 SoC
>> from SpacemiT.
>>=20
>> Signed-off-by: Guodong Xu <guodong@riscstar.com>
>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>> ---
>>  include/dt-bindings/dma/k1-pdma.h | 56 ++++++++++++++++++++++++++++++++=
+++++++
>
> Also, this is not a separate commit.
Could you please clarify? This patch already contains only a single file
(include/dt-bindings/dma/k3-pdma.h).

                                    - Troy
