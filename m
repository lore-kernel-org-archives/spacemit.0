Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BB24A2A78
	for <spacemit@lists.linux.dev>; Sun, 18 Oct 2026 14:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792332537; cv=none; b=DmEerfRAUvOF1zCaDp0S4wBvlAJ68v2ppef7S8N3jmQ15XEhA8NcB5IYAAqqnGgX7a7oZOjnqp3sToIWpMK1pj4gRpXZUfJAFzBzd1IYaDrJqAOVBsZN/QVksg2MnploweUgg3dGZ6cZbgbJWSX9ExdwA7eWcHvNg1bnAqlw3rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792332537; c=relaxed/simple;
	bh=a9xujErffccRWJmb2kmaLMfqp7WKEG50k3ZOPDrgYt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i2/J1RJZxAgzkHLh4Us8QSgeSjUial3/BZEeIvo5omR8wdu2i6kwsMCssMA5PHMrdDMHfFgIleAmL6XHz8XUB8kpGZRFsbtvTHRjKyPidy0uvFeEiqRedEz30BZB5PiY5oArqmbqNeeHIlXvqgWq8wZVsQ3hQsUlKrEgn+aKlVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e1iKxcVd; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e1iKxcVd"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so1218583a91.3
        for <spacemit@lists.linux.dev>; Sun, 18 Oct 2026 07:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792332536; x=1792937336; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a9xujErffccRWJmb2kmaLMfqp7WKEG50k3ZOPDrgYt4=;
        b=e1iKxcVdCvS9EE80wQ82EYj6kL5GwMcx6Um3PxptiPbCFZEyKWhTbBg/HdV39z8GB+
         c+Vd6aNUe9TtKNONerwEDQHQIVoPqj9mkaCIF8O1r6p7Sary/XpoQ3RF9xXDukwje41q
         Z/HidiJJOlab3IuKyJI8h4w9+uu1kyM5ZjEatrx3WqzBaK+C51LoOYUYzEO8rCZiv4Ho
         ZO3jV2xq61vdzzH6ebcOpdhEXS72DoBoZM5HT/LjIkdbPTD4ZNgd/5+OI2iad5jv4kud
         XIRmsytIMOG6M0gx0hqavmaH0eW+Ex6yrv5P0GDKnbyU9/lLdYzBMKMvN+eQ2E5Yw60k
         ljzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792332536; x=1792937336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a9xujErffccRWJmb2kmaLMfqp7WKEG50k3ZOPDrgYt4=;
        b=fxJDLPGHTisPPWG3ETr6y9mi6DzW1UueX2T8WlGQdeKVRP85YL5Ge65LrzvmX+zrfU
         C60fUnhCvgouJICuD1Vm6c78qm+euVmKEzxTC1qm+EesBWBk4Cwce5b6nXjZCqFCYZqc
         65xCVG084t8lYUJerj8cVlwkyl5xflIgUhD4Xk5OXOg4kq21ctZG8VRm1pLbZsAtGp8s
         LzS9vSMmKLg5cHz2EIjZkTVmnIPION7Z71fAPt75COD2AoiE0RxV1iqMJNYR9x13ERPM
         V2KVNeJC/kgDy/roCdqbXgXi75/rExRKeQ6l005RT1GWLYY2BLD8tgZhbHU+6n3jLGqD
         VyqA==
X-Forwarded-Encrypted: i=1; AKwUvBzMmcGOvDH+Rr+lq6d4bYIH8TV6qiemvKG4tF8tHMfABED/tgUYlqkgmZWvLwaYworgZTgnHdzkJQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYJgfLxssSqgLVerzegtc9Xi6HssOPEbQ8cK6tSZZcF1fp0g5WOT
	Id8rjKO431ZKZAmLrxUSKm6/dHtgCghSlyL96C8fZJ2yx5tYpBmX4Czi
X-Gm-Gg: AYBFou2NuqV6sVqFlpgPYw+cWy+ObMx0KdjzsCjkVpBIsO/Yz0UpIzNcwwvK0FAExY8
	dLcZ0zLTzAWUPH4WaOFICd2WqUzBV5LQ3l39aRlwoUbbpRj5t6+Zv+RRtg/4jqSFOmkSyax3/9j
	cHec69ELpEUed9QflcX0e+xHH67LmfWE6aVpdRCx4H+4jzwcYTKOSCA8LHPu72vzdLk7vCYoBUU
	GE6dniItUGekoK0CBl3l1JST9fo8yFqaJEfOOc/4zu0ON2/qwcPzerXDUIqSPlYs6QJuwIbL3XD
	dv53tyIT4+/YvzUXKiIPB+UCfz6qF2PLUq/X2FIIOgGVVKp1K4/u6WIVyPaGYERKIDrFHmlEhUi
	kxR3hl0Q8pwWgWfeWtEsY9srbwlrgMhQ2bWcy8q06bpcvPXKzSt7I+uZ5+7yzcFYVlNF4SDA5if
	FaemChbHzt6gq8IsnmOoBOb3BcDO72yPKU3712PSMN2uwWh6H6dyw1IZ+puEdfORiEVueA3AYzs
	AoqaTBsFDi3K6EPQKw8q8Uw+ZJv0C0ZmkLgk7JNRWhjvgaoHQgcDantXI4xwwq1ROd8Jg1NR7C+
	qyzBQOZiZWRswvy/cYUYuLBfG829wOUCAjowjS1gbQH3sOUKBBcvnQ==
X-Received: by 2002:a17:90b:4a4b:b0:3ab:188b:c5be with SMTP id 98e67ed59e1d1-3acef15462cmr4793176a91.45.1792332536192;
        Sun, 18 Oct 2026 07:08:56 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac947cf9a5sm16970791a91.15.2026.10.18.07.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 07:08:55 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: E Shattow <e@freeshell.de>
Cc: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] riscv: dts: spacemit: k1: mark boot-critical SoC nodes bootph-pre-ram
Date: Sun, 18 Oct 2026 22:08:42 +0800
Message-ID: <20261018140850.1630481-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <05e0c9e4-4e27-4114-866a-ec55c33ba349@freeshell.de>
References: <20261017180141.3477743-2-alan.tseng.cs@gmail.com> <05e0c9e4-4e27-4114-866a-ec55c33ba349@freeshell.de>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi E,

E Shattow wrote:
> Drop this last paragraph/sentence or place after scissors line, not for
> the commit message itself.

Thanks, I will drop it in v3.

> Presumably the BootROM does configure all of the above?

Mostly. The boot straps select SD, eMMC, SPI NOR or NAND, and the
BootROM loads the SPL from there, so the SPL needs the same
controllers and the clock and reset controllers behind them. The
BootROM also prints to the console UART.

i2c8 is different. The BootROM does not touch the PMIC, but the SPL
has to set the PMIC regulators over i2c8 before it can bring up DRAM.
I will give that as the reason in v3 instead of the U-Boot sentence.

The BootROM can also load the SPL over USB fastboot. I left USB out
of this series and can add it in a follow-up.

Thanks for the review.

Hung-Chun
