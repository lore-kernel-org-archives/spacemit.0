Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9761400E
	for <spacemit@lists.linux.dev>; Tue, 23 Sep 2025 19:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758657234; cv=none; b=LZPvrpW+bVqfv/CEQxHPCaKfEi2XZb2OZzkOoDQHK+FZ/FL/GMEfM8y9Y+uV/nh8yJBje0Lcs+KXUYS7uQ9B5Ku+d6UWi3jyL94ECVIl4qTpuH5DN15NieqrmveN0cOTnIxJzsKx8eCI42+5o4fJWcPAWMC0cHJWZl1PdPeLB2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758657234; c=relaxed/simple;
	bh=0mBis1ZnHz5kuXTa0qhxPoN39RlWHxLzYEKVGbcdtmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mX9aVFylATlWLR56x5Hp5YsFYVhYQxs9Q51N2Y6batJs/LNY4O0Pib3TzPtLwWYpcoUUO0+r1cUyoTMPHIciZhvWD+3SeCod0FtCCuUfe78nVNIdtSuZO4i2ljxUnc11jT52dauS5VvSRN4LNeAO5AlCrY9CVY/ivNULKmrzpqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=HZe8WrQs; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="HZe8WrQs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=bL/H
	Qu99e0loUqX4/EAdPey3KBU4E0QmfqrUkhK6tZA=; b=HZe8WrQsacmJfb75TrUq
	9RzTsUMPFrYqllnHCrRudUXiw47TScoCmWpbbC2sHzbHK4r6yzE95dEyryT/970j
	B0YclNHdrVfQYK8GD1x7MqpOECIXS5X8xRYrVLvqTTFLHHD1tAsD6Or8LgPslhQG
	UmBlq20NUU/7QbcAG/Gkoyt+ca76wo+G/9Sa8aM66oDim9XPUEISvVZF490nUdcq
	kqpEAIDNkbN7I/ii6DRIkjL7N1YkdUUuSPAgPFTN0UM35a1oWhlrQsZgETYT7Rt6
	QpCqfx4zLu8LyAX2NrMrHiXJD+ixyQaB3pQzpW63lvBYviqJ4ywAWDVhrTx9JZxb
	RQ==
Received: (qmail 1226268 invoked from network); 23 Sep 2025 21:53:50 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Sep 2025 21:53:50 +0200
X-UD-Smtp-Session: l3s3148p1@RUU4S30/ju0ujnsp
Date: Tue, 23 Sep 2025 21:53:45 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: spacemit,k1-i2c: Minor whitespace
 cleanup in example
Message-ID: <aNL6yd5QLQzW8b0h@shikoro>
References: <20250821083205.46600-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821083205.46600-2-krzysztof.kozlowski@linaro.org>

On Thu, Aug 21, 2025 at 10:32:06AM +0200, Krzysztof Kozlowski wrote:
> The DTS code coding style expects exactly one space around '='
> character.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Troy Mitchell <troymitchell988@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Applied to for-next, thanks!

