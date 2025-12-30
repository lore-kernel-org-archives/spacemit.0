Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C065428C84A;
	Tue, 30 Dec 2025 12:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767097301; cv=none; b=iEuy/+sVctOy+RIhno6JzDj3UmplSrZztTOw4vdEbCyZoPJFMoHgccDzOSK/G4JRdcgYsRmhe2W7ShI93pDsfQBXAx2eXY0thG8QCOiPVcjqT/yibL3VfnNaj1V59SahwnSpyK3Ru/CbYkBH+j5iBXay5xmnsWCWrQneOKVIfKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767097301; c=relaxed/simple;
	bh=QKQ5eoIAn/js5eOEFKHYKJSMufjyeI6KZAIRALCLBgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GhT1INxnjNTOmNp3b3iJsNrJW/MFfnATVcdCrIbnIuOqNM38UNVlbgdm7T7LPl21e0cIEwQmMCTXi23PvWl+i/q1t/E8QzKacyI2hbdmHKgF+3DsAHEheWpYzt5UsjMspYSEJAejWEcy9CllspfgqaXpg+1tlCUi9mqFespLDnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eodlMm/E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eodlMm/E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CD36C113D0;
	Tue, 30 Dec 2025 12:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767097301;
	bh=QKQ5eoIAn/js5eOEFKHYKJSMufjyeI6KZAIRALCLBgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eodlMm/Eq7PwChFtTphOGsaKVCSGp2WMv/2Jf6WjbML0qTHtggSiiPllMvgKJCrXQ
	 WbIqU21S3Ts2x31nnAyc6EsQ/+dK9KERTl6/DuLOuSRPfw3AmNT0wW6UsT5bEcZ++Q
	 O8m6bihbIz+8znAnTvO2kMoHmQv7KsQaMmMKLvHfij7SrAr9MmmvspBSg7eL8NyH+d
	 A96/fROTFltCPnOvX20/R0GHFCsF+iNYQiltZkSid2WTBXBGV1W71AmE6u98dcg4xI
	 1IFCpzoVrpa8t8427wrHJr2Nvl5F2Bhn/M3z/D2wuv9Xdgp6Vv869WHE5xgkssDJG7
	 3gNw8bedVf1rQ==
Date: Tue, 30 Dec 2025 13:21:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Alex Elder <elder@riscstar.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/4] dt-bindings: reset: spacemit: Add K3 reset IDs
Message-ID: <20251230-charming-nonchalant-goat-98bbde@quoll>
References: <20251229-k3-reset-v1-0-eda0747bded3@riscstar.com>
 <20251229-k3-reset-v1-1-eda0747bded3@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251229-k3-reset-v1-1-eda0747bded3@riscstar.com>

On Mon, Dec 29, 2025 at 07:04:04PM +0800, Guodong Xu wrote:
> Add reset IDs for SpacemiT K3 SoC.

Why? Where is the actual binding? You have entire commit msg to explain
that, instead of duplicating subject.

I am pretty sure I already asked this for a different patchset from
you...


> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
>  include/dt-bindings/reset/spacemit,k3-resets.h | 171 +++++++++++++++++++++++++
>  1 file changed, 171 insertions(+)

Best regards,
Krzysztof

