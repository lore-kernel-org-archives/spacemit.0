Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECC81EF39E;
	Sat, 25 Jul 2026 20:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785012518; cv=none; b=mQTlPssjIvxZwv51oV21MqWqcPdD61SWxnTDJeTHz/VYbVMJxszuoXawXrpM6eEazgC7iaDWlCpsQqKdYyBwqOU7HJaVdn+nvoSXMNNRCRsXdi9rzsJWry30+NGopPlUcvMNPaUcFsSNuscOdsT15Dt0W7HIg08AjNcYaKfyuJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785012518; c=relaxed/simple;
	bh=t6PhaJPPov93qe/frNB6MZWbq9BsECuXnqykEm8bOes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ojHxr+tPrZbnZoQDqjfus9Hfny2oxYuafJAd25IV0TWScvQsQyb6dXlVfK3OS2UFvqLFCPEJlj5MDovMznYCebDmZ5BABuouqL3nONZQkEqFXbTN5gS7HvIxMeJv5j/5KWR8Li8OQYl4AedfJZhgmbcG1s3welzd5Mn6xi5JXJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mdxongxr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mdxongxr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 184461F000E9;
	Sat, 25 Jul 2026 20:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785012516;
	bh=KOmL0CnJCd+9BgF1lWQ87vbI2jwqTrH0CBCL3BgOgnQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mdxongxrGDOmaWvmpqv6awjE+xsf1uuypD+R6mW5bkMRUe3s2DDoelCWTrs6ODPJp
	 8uLoXU6reu41chqvJdBvsbGyZh3lJQmISmkFLUVB4E8d0WOiG5zVvAac1qpe9mXYxZ
	 ebJOsXvTZutFzZE7gb25HyKMM4gp3LQzDL+G/xRQkupyeoYL5n7f3I3eiZT5e2uwHf
	 WE4VjLLDL5O465oi6ZlqC7K0C8FoklfehWS1Gg937pnO2Dq91ciEmg+rptvpKgbKaQ
	 VEB7zkvr3u0aa1/9Cf8VU+/8l2EYRutphLukHBwxvv9uKBc9tgoUey7QomGdHsjND2
	 uE26XfRS0u9Uw==
Date: Sat, 25 Jul 2026 20:48:34 +0000
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: enable PCIe on OrangePi R2S
Message-ID: <20260725204834-GKC77474@kernel.org>
References: <20260602100000.2402784-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260602100000.2402784-1-amadeus@jmu.edu.cn>

Hi Chukun,

On 18:00 Tue 02 Jun     , Chukun Pan wrote:
> Enable the two RTL8125 network controllers and corresponding
> PHYs connected via the PCIe controllers on the OrangePi R2S.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
Sorry for missing this one, and thanks

Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)
