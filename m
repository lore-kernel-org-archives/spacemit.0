Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564F536AB58
	for <spacemit@lists.linux.dev>; Tue, 17 Feb 2026 16:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771344034; cv=pass; b=sK3WDTBDxj9CrMmSqn7Gkmf7AUcSFnzeS0zSe2vWOqjJ7gCyysEMRH6kULc419QwKWwK3dSwjgFSOf0G1Pwf2C5F4WgaxB7Mblw5iyR9H62VgGTrNPIaGyBGE4Ausz+vVRLXLbQyJN7X8ModQHx1TphOrVSvyEcLGf+4PFh9468=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771344034; c=relaxed/simple;
	bh=lBO6AhQqWag/0+NNJRZQvsAXIIMwJp6QA15wbRYbOcE=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pj1ifApLVcoZkgNoOHCQnuYz3s7y7YVnhbcuWFZp6GJha5hEq1ZJxDCrA/Hk2monPkJxCfPBlQS3QEGy3iZCtXv0qXp5lMWzs7bLASZwHaBp+6AI7OSdxxcc7wbVGayO/fTrqBWiUEQZCxgin9WsIrw4APl58l9hlfEyqoOV3v4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ANofEyR0; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ANofEyR0"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-65a40f3f048so6894217a12.3
        for <spacemit@lists.linux.dev>; Tue, 17 Feb 2026 08:00:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771344032; cv=none;
        d=google.com; s=arc-20240605;
        b=jdyCnHsrFZCujOoKMUUUEPkdbo93Jknkb0fXAZtj5eI2uFEI3tXw03TWyw4CgbSwii
         pIkEQxwZTs7ykdEkWZB2JXo2zJ9ib3Rc0hiIhCct5rHk04tBhKQUytuPvg3qQ9QNkjFD
         4z7exwXa5RhjYBh5ccXR4RRpzD52z3QlxUjw6e0NdkXYsmqGMrVAdj9FM+5sfdam2u+n
         Vs6QFRYXKBNVlSjk3ZfYYHuz2xIGPFCvl3gCtQYFWo3QMv8B+JLGhLeCB2Y8kUHaIqXY
         WC7ZQYdVWx3Knkdi9dCLjDNC837e1P03DYZzLIEkQZb9ypZo6Ac27wgy4JowS4XnauTd
         nBQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=lBO6AhQqWag/0+NNJRZQvsAXIIMwJp6QA15wbRYbOcE=;
        fh=SpAFTfzlZSU8lY1muInGfZdxsf5VIxmPQApCd/4pSpQ=;
        b=cuWnPjUxnrcrNjKy7KippZSklnjnfFAgzKrbA58GZZtqoU5gXR554GeU3nlquICQv2
         DwNF5tAaUU6Rxb9dcO6CH00TbRaETF/wzJczBgW8ax0rk1WOBsPQdMANKP2kRf6PYlCr
         C6Eq1iq3wJcXgxre0CUD8gy8tQ0Gn9dz3iSu50e7RZvm8feibiY3iiLkcyrcmnWHsZxL
         96+Es5/JUFTTwykKMk8ZjrgyBqwwEsNpxP+XsH2VuRrw7AOisj29vktF22LxVkFp4hTd
         vamxAjtyhQZKQlB51XaSPTh2rLshYkWheFYBHRmk+M4JOCBSMi5QBk4zWmUi2kzJ6bRJ
         TLJg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771344032; x=1771948832; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lBO6AhQqWag/0+NNJRZQvsAXIIMwJp6QA15wbRYbOcE=;
        b=ANofEyR0YMHxsGJ/K8ZcPp64xifGjUU3beWMPZrbpqI29WTh03lfiD4tUBK86ZswjN
         mQrISRVU3YtzSPzKDyn3+gjmd43KO9bRICKJ0H6pm5oewadzOYcm4+30J5TgXjcEv8wy
         TjXuuvvhYb+SFpfO8/YZjOQiMW7vrveDXmtPFF2F/xulCHYuktwMAprRxi3hfM08HKjc
         I1+EDqVgf8q7Pjq17YyABidZrUoxTfwLguFmlvZZsjs19ZmJhdIO/sw13rCoYbI2gN9q
         yWq+jNsTFmCJcNZKRXHC/HnsbF/V8U9jFPJRbAIHj+W51XvpdEKJlCfvyfq8lB/tk/U/
         Gz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771344032; x=1771948832;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lBO6AhQqWag/0+NNJRZQvsAXIIMwJp6QA15wbRYbOcE=;
        b=u7ySrDREyJRdMWEjbVfzFVMmYkKktLH051ugGM3G+e9AFzLQQTaMCG9Ug+0QHDGMEG
         M550qBInYFj7DQUK1xXZwjtERK01kjwUetDNE0XaHU34M8eI2WbLsjdFKiAlCLUkqHBT
         fbqmIWpdpogPLHrucutpFYS9CCZAd26eGnJEGrCTc0aE+rrS4n2SywK9rwJc25NtXe0p
         WTURfZi9MRExbg1PMdhVbjwoGJDzsHtBNIhZnhKzG8xLz07sb8K7RicKwnC6DtAq7QfA
         I3k5ZvNiKXgy5Mv2smK8ItzK3Om9h3sl0BY6M4OZipbow8Z6qWs/8iWVRosSnRSaDmAd
         Z5Eg==
X-Forwarded-Encrypted: i=1; AJvYcCVLXKjPKjFecVAuQl6sGrUIHNJnenLeFHtHFGisouJzNyd5gP25r+hXQO/FPtXOtCHRYQTevB2nAg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywc34hNbbEqgkpIov2htkdeY01x+0vVLSGdz6fMSPAijGFaCOfG
	cNuYPe++pwiINX+umrkuhU1N5aq4cpGrkUrA3h/S2Waj/49uKd2bjcZnMT/aW9Y0S79ti7qdReQ
	EAb59PW3wR0alK/7ob9nfqAe4Wk8mUMU=
X-Gm-Gg: AZuq6aJFNJMTvReWEGxV9+qroo44GKgF0V1k16/4puJEv7Lq6B9+MBH5ZEaUc7hGIef
	AY+DMgjCLCSQiIrOUAbpyC4ZSvibI6lqYJWEiNUyRov1rB/k3Gcq5CqmTLLBvZe9/kNhq2lsgAO
	8ee7JhySOfCGd9S0/vYcQi5Brca8xBOrUCNWEIXVQOjwTi6ujz6rdgIVoC+FOINaeMYGKd+7rtm
	dW4WGVqwQ+0ZUG4KB+FBkxF+rYJELKVTDWD7RUNyhnYpRkQcjYo1svlI+5+G/O80ROASDg3rI9v
	CPSo7w==
X-Received: by 2002:a05:6402:1ece:b0:659:329a:bc12 with SMTP id
 4fb4d7f45d1cf-65bb13b7f0amr6896476a12.29.1771344031210; Tue, 17 Feb 2026
 08:00:31 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 17 Feb 2026 10:00:29 -0600
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 17 Feb 2026 10:00:29 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260130022705.1059214-1-inochiama@gmail.com>
References: <20260130022705.1059214-1-inochiama@gmail.com>
From: Emil Renner Berthing <emil.renner.berthing@gmail.com>
User-Agent: alot/0.0.0
Date: Tue, 17 Feb 2026 10:00:29 -0600
X-Gm-Features: AaiRm52I-Ps0aB0W3gGP80VOXo7IKX3SoIAUz1UAML5FnQLUef3qoiKkhjg5t58
Message-ID: <CANBLGczi6o4NwDF0fge0_RZ+TVX2dQ=vYD2PYMSupb5xSnabZQ@mail.gmail.com>
Subject: Re: [PATCH net-next v4 0/3] riscv: spacemit: Add ethernet support for K3
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Boon Khai Ng <boon.khai.ng@altera.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paolo Abeni <pabeni@redhat.com>, Paul Walmsley <pjw@kernel.org>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Richard Cochran <richardcochran@gmail.com>, 
	Rob Herring <robh@kernel.org>, Shangjuan Wei <weishangjuan@eswincomputing.com>, 
	Yanteng Si <siyanteng@cqsoftware.com.cn>, Yao Zi <ziyao@disroot.org>, 
	Yixun Lan <dlan@gentoo.org>, Zhi Li <lizhi2@eswincomputing.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Longbin Li <looong.bin@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Quoting Inochi Amaoto (2026-01-30 03:27:01)
> Add initial support for ethernet controller of the Spacemit K3 SoC.
> This ethernet controller is almost a standard Synopsys DesignWare
> MAC (version 5.40a). This controller require a syscon device to
> configure some basic features, like interface type and internal delay.

Hi Inochi,

Do you have a tree that includes the dt entries?
Otherwise how are we going to test this?

/Emil
