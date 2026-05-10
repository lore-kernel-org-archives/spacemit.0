Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675853815EA;
	Sun, 10 May 2026 12:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778416288; cv=none; b=I/7TiavexDfRt1KHauEfzNpPt4YX14+ewv455r6tKm3OnA02zMwJdiQ19Co/RiDZXsRe49zEQztrV+RrCqCJEAKq3Sv3JFE3T4sE7PeNJLYjxz2tb8zxAz2hzNZzgC/XwtEgYjb6Uwry9JxKRDJP3+PuijHNvMsrLmumu7+tAAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778416288; c=relaxed/simple;
	bh=Ff/B4KxNBZMQywpnIfxmpeNFZWzaDYfLmaF91BK2Y0o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jJEMmRTY0CuJsKhDldp7m5FRTiCICCzdvJYgUSvovP9R0OiU0g5AfTR3CS0UC0KXDwAdvJ6cmRFRQk+3f/Myudc/gFQT6w1P+Tc6r6Jdu11pyaF/ad3iY3McanKJihg7y5737494Okzh9AdE9xxpWwu/JrF6W3euaDrHu97dT9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oDp+KODB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oDp+KODB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C8A4C2BCB8;
	Sun, 10 May 2026 12:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778416288;
	bh=Ff/B4KxNBZMQywpnIfxmpeNFZWzaDYfLmaF91BK2Y0o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oDp+KODB/+gujPT1prT4mhlQ4OnHP3sFOj6iuiN8taPKf+wezG/cAAujkiwGujLIj
	 HQITdb5qdimBuShm2X/k9u1qjq+zBVn7RTIPhurXvn0XS7YirpuwYFwTY4rvr55p6i
	 uGHr/9GuUoVwXcLMg1drqaYL/WecLmJHTrZnYL+8Av8pJTD5r5BvQxtOtffHXkQsnV
	 BoRxRH0EJaJj3hgrBL3NGkbyQIF9PKknwufnZ6x7ad4rfe/eLPmR288XBiQfrjPJCr
	 sQwfucxIeRySRyihVxlCEyOh2rWP8quG3sA8wK1T1FpIh7yC9rPw8AvbFmw2r3k8sL
	 YgAv3mCu64Ccw==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>, 
 Yixun Lan <dlan@kernel.org>
Cc: Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Yao Zi <me@ziyao.cc>
In-Reply-To: <20260305-11-k3-usb2-phy-v4-0-15554fb933bc@kernel.org>
References: <20260305-11-k3-usb2-phy-v4-0-15554fb933bc@kernel.org>
Subject: Re: [PATCH v4 0/2] phy: spacemit: Add USB2 PHY support for K3 SoC
Message-Id: <177841628298.434434.4061327159499259923.b4-ty@kernel.org>
Date: Sun, 10 May 2026 18:01:22 +0530
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 05 Mar 2026 01:00:50 +0000, Yixun Lan wrote:
> The series trys to add USB2 PHY support for SpacemiT K3 SoC, while
> patch [1/2] implement a disconnect function which is needed during
> next connection.
> 
> No DTS part has been inclueded in this series, instead I plan to
> submit them later while adding USB host support.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: phy: spacemit: k3: add USB2 PHY support
      commit: ad8fdebd40fd25e86331886f4fc6951531691319
[2/2] phy: k1-usb: k3: add USB2 PHY support
      commit: 056ee8b37bc91e3230afa11ec1018fa898b983b8

Best regards,
-- 
~Vinod


