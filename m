Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794969863;
	b=Vv/J5sNuHdom5uKlxiFTBKr6TT1VBlrOXhuGzagw/nqw35o0zsHzME1qT3P1v7eNpzRJ
	 wIDTR8U8me3ooCa708C5ropT0IjKwpSZUNL4CLZLzmzzWyiVWrFgqO2DDV72WJwO2TjGD
	 zNthGh+w+/McalHxjVgbwGjjVjEn+IaMo1Vt9kl1lydTkpaXVXP+2VKwj6gaijkTQCsyY
	 +ymaYgdHdh1rLwKVtiLPHQFu/Mm5cf917qYRiqv6aY+BUnMpKE9HfEKD1+IeooXv/7BXu
	 Vxwp84d4CJqZ7XOJ068GK7n9UW4A1u8ewb+X7DwtyZVQjYoELWsCNKt1QV5v17UhEjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794969863;
	h=Received:DKIM-Signature:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:MIME-Version:Content-Type;
	bh=5DmkecMOTxZcIAZAb7P1VP7UPFOxhN7PcQY3b0v1YXY=;
	b=fc6elC4U9fPPlkZEYHkfscuHR+inhAn8pQe/3QWmMDoyqoifwx41nMnpDb6wMJ0x07JO
	 dmDS1s7QVMUxXo03hr6WGzamEEwuDmN3ecW2I6ihYMqclcjdyFym4hCDvrj5H3fTS8r8y
	 2o3GWZiZnjC7siYxw/0/1ir10OkDEciRstAwOnoa+rBvZRhIrLEu+RrRIi2UE1HNl7uTa
	 lizdZoykJJyOomhf/2brFJ3dGaa8MpcAI9piJmP2cGFLL82MvUM/jkl29oGD6fGKbTiFE
	 ArwIUZw3Xe5VZahr2pviyyKxXU9uWg6gMmqTQRV9stTpOA2OcV3u1ljmMsfDfj/+g7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gwsU4fMU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B470C606A325;
	Wed, 18 Nov 2026 02:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gwsU4fMU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F4BB1F000C4;
	Wed, 18 Nov 2026 02:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794969863;
	bh=5DmkecMOTxZcIAZAb7P1VP7UPFOxhN7PcQY3b0v1YXY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=gwsU4fMU0b33MQ2MR39aAqpL9POjPT5wykdAHXSvaf5hfwatitC6yk+RAqIGQBips
	 4ow3sZO8g2zlLwD7iYslfmLY4bG98/tsi5FcoSzW30ZC9AgMQyzkFSvvQgeGfSPGdR
	 1rGSrxJEhtzMfesUiPiEabwUGEz6Q0eZKzI4Zo+nGZI+N3qXTN+xnECFlKFaVZYzRD
	 98RQ113mVhV0yfzfix5MmEs9P+rme6X9O+BAIOHvj7A28eN1ugNUuNbfevx6IeK6tE
	 6RywKyhKb1zuQNm7QRmV0u87u4J5RRJb6f9M/2b8GEZJ8WtDVFkjKPo8QNhk3nrwJK
	 g9FgjV14jcP1w==
Date: Tue, 17 Nov 2026 19:44:19 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
cc: Conor Dooley <conor.dooley@microchip.com>, 
    Valentina Fernandez <valentina.fernandezalanis@microchip.com>, 
    Daire McNamara <daire.mcnamara@microchip.com>, 
    Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Yixun Lan <dlan@kernel.org>, 
    Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
    linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
    linux-kernel@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: k1: Correct missing space
In-Reply-To: <20261113185214.182695-4-krzysztof.kozlowski@oss.qualcomm.com>
Message-ID: <30dae12b-690e-a11d-89b3-bc6eebc1c4da@kernel.org>
References: <20261113185214.182695-3-krzysztof.kozlowski@oss.qualcomm.com> <20261113185214.182695-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 13 Nov 2026, Krzysztof Kozlowski wrote:

> Correct minor style issue around white-space - missing space.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks, queued for v7.4-rc.


- Paul
