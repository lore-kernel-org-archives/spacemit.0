Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794985740;
	b=pCOiF+iWJmwfDSERMJFeXw6yfIObcD4rldFyHk7DQmo616rFB+PZ5xFN5hTMENv54V2k
	 9oDbA5mWhfI0jXY8y0SHKPuLr4qGwUsetabaV5HTEsMPujmealrRiY15rhwxXDYUC/NZV
	 Jkwsh65rxpNCRHoDSCES11gU+o390HCgeZNOYo2VMFBiuN2IrB1kn7KB6w+M7IHgEAgrv
	 ibczXTrAXXpzUglkDMLVpHAGrdse8pV47hLTo5QQy5OgAKfoe9mjVTMBZeX21gUdqSXfO
	 uXrbp+Zg/hYiMg1RckP0D5CCqBcYjPl3ZdrCSLp2Zr1zAf7dLdM3VwZ9vbm7IsTNLtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794985740;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=L1kBsRXVv/qLCpMTuLfhWNyDVKrXmHpax7bqY4zUUAw=;
	b=vrY5egM83fjMT8WVbss5KpQZg1Z0n7At2aJPSUSwUMszWH3R/xfMmaSmvUI0ybrFiZxI
	 RxQrmIISDPkLshiOuoRer6Pgl3a2hPRbam/AmD/ASoBNfjgLmSpMAGKLY//qoAXmTRLoV
	 70y72MVpthgbJJubi9ITB0B+JW0G1jkTZZYMfGtlD1xBPpQohZU9y02RQJYZ9sPrA5hQB
	 zBo/2MGT+YrPpjw5skF369rwmbptg22b/ZHO6lEO26eZYD26378R6gQLiQ8cH+gWYxgUs
	 cDVb5kYEyS5d69VgmJCrmP/1aBTebkRh0hSQeU8t7Ia1SS/5i4rkMWD1bPchpC06Clw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NY63LtWv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F92606A325;
	Wed, 18 Nov 2026 07:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NY63LtWv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CA0E1F000C6;
	Wed, 18 Nov 2026 07:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794985740;
	bh=L1kBsRXVv/qLCpMTuLfhWNyDVKrXmHpax7bqY4zUUAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NY63LtWvTG4DFCjCGGxa7EugooCUSrsgjoZvkE8UizC17cfBy+7bu4ADEswLSz8R/
	 sGgOyKgjcCvt4/AOYrkKRemqsWM/ioVmwgAoTtHv5TS41HBCROAuJZ4zZFWpu8sYgO
	 ZafNQt1fvGwXYltJ0Az+OmGo0EKM3lsnfUYBCdKPlSmDGgMGbVLX/7ittsI7c+bgwF
	 tiGaI+rUFVn7iEU4PSjwlb3P7r5LNje8WemGgZGvTIzbJmoNknUUCMkWGEincDQ9YP
	 OhG8+VTkM4D1fuixJtHBsHojgksB/mPCfCA6vTjoc0Eq7a96u6+Ty8y50JzMDeXRyl
	 NZKzqMbjWPRkw==
Date: Wed, 18 Nov 2026 07:08:57 +0000
From: Yixun Lan <dlan@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: k1: Correct missing space
Message-ID: <20261118070857-GKA156369@kernel.org>
References: <20261113185214.182695-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20261113185214.182695-4-krzysztof.kozlowski@oss.qualcomm.com>
 <30dae12b-690e-a11d-89b3-bc6eebc1c4da@kernel.org>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <30dae12b-690e-a11d-89b3-bc6eebc1c4da@kernel.org>

Hi Paul,

On 19:44 Tue 17 Nov     , Paul Walmsley wrote:
> On Fri, 13 Nov 2026, Krzysztof Kozlowski wrote:
> 
> > Correct minor style issue around white-space - missing space.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Thanks, queued for v7.4-rc.
> 
I would prefer the DTS only patch goes via SpacemiT SoC tree [1],
which would avoid potential conflicts..

Link: https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git [1]

-- 
Yixun Lan (dlan)
