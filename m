Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFAB2FE05B;
	Sun, 17 May 2026 07:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779003537; cv=none; b=NGgzsz7JHq76lIfH3Kq7/1zcwFbCoQc5XcTHEebX8UFDANkNwvXbHchFcEfnWH345J02awhBcDaRtKePmmD8GbLJX0g1vS5kFtPsM++dsFai20qgAouJl3tRX3dxCb74LvU9Yw8Ln45hrM/AUnY5eMcojykHQiH4s6OWKpHSyhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779003537; c=relaxed/simple;
	bh=mz0YyvKbaoc6XCBeyQG6RvdKAicdcMQPsi1mL2zEflE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ceQfkc8PZjObv4/nOtp5d8YwmKOpz/eMBysmtiAxRdLxLAB2UoL6h29W+yZYWao7ZNGynPPUccq2RDfA3YPuo6rMVxJw3TlweKaShcADQcyGROGXSZWxquFoW7gFyLfMj3GJ5eIZBWeYPXpVjakLX5VozKG8dX8mKn1wa/nJKIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bzxt24Wb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bzxt24Wb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 233CBC2BCB0;
	Sun, 17 May 2026 07:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779003537;
	bh=mz0YyvKbaoc6XCBeyQG6RvdKAicdcMQPsi1mL2zEflE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bzxt24WbxfJLarfJjsVq8eZ455EbF96WS3mkkR7S4rrVQEdtHjpPnvxL5y0IEoTmm
	 73dBAUsdb/gmfJEBBYNnaDECi/Xix91558aQPluJ3FurUBZ69ymZwtGnBUrZz6Ggvp
	 qkjbIRD2nY4EnAFn9Jvl8BeCNc2lfVvb6Lw/uUnHi2NHbCHJ4WrtMN081mhXQtNS1i
	 ELEkiNtfLTDRInXiwyh4kWE4A35oxZesG00sf5NneGKKCR3r2a7zSlkVQH50VgEY1S
	 1C37iPpFNnVUsqY4+6q1PIG2OM4Zy0TxkP7mWOlUM3Qgz2Zn7V605WqoKOEIBms0O8
	 6WLmkeVK8mJ2g==
Date: Sun, 17 May 2026 07:38:55 +0000
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org,
	devicetree@vger.kernel.org, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	pjw@kernel.org, robh@kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: enable QSPI for OrangePi RV2
Message-ID: <20260517073855-GKB3679294@kernel.org>
References: <177893657188.2456968.7429508961699495905.b4-ty@b4>
 <20260517070006.1836396-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517070006.1836396-1-amadeus@jmu.edu.cn>

Hi Chukun,

On 15:00 Sun 17 May     , Chukun Pan wrote:
> Hi,
> 
> > Applied, thanks!
> 
> Wow, you're so fast!
> The robot report has one typo:
> 
> > +			uboot@a00000 {
> > +				reg = <0xa0000 0x760000>;
> > +			};
> 
> This should be:
> ```
> 			uboot@a0000 {
> ```
> 
> Could you fix it? Or I can send the v2 patch.
> 
Ok, I will fix it

-- 
Yixun Lan (dlan)
