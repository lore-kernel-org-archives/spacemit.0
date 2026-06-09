Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9059A402BB8;
	Tue,  9 Jun 2026 12:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781006425; cv=none; b=TUqiV+vrgDwd+PsIyKqUoRSrwa9A1RrpcRCoF3CP18VFYWBvbofXJTd2eUq4/UCUPpiRKBekxuTEaoLiNsomf2ha8S2IBh5/pr6xZOl8gkFWX1GcgnrEYNZXNxU6tttXC1zlIVroQGx25G/jRhjqpeL0wRYERi6eKcW86qNR+Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781006425; c=relaxed/simple;
	bh=IGpGE5ahmXWsAZ86oddfO+WhOssxkQfsvaFstbpbUH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qKzduKhvwy8n59hohWQ4F4OBpU28oSPDNXOSCYY6mdLJVH+tRP9sm6kBANIvfD54cyNTnE6UUS0ZCXua2KTQF+cJvt4v3ToYsJxdyZyfSYNRwNvwIlqvWHqlznzW2ccJIqYbt4U3EejHMNTuC6YB2IlT0KBHwQKRHkDo7fev+tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m0/wYDh7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m0/wYDh7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 121F51F00893;
	Tue,  9 Jun 2026 12:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781006423;
	bh=YqAY2yjF1JOeRihI2p1gxnrbLAfEXGmBDITPkBFPHmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m0/wYDh737gkZwT3FN3edFJLbv3a+bjleGY4f+o86IiNjItI4KQvNxC2tr7kOjGBu
	 uBb09XVxLPonpuIzJ1lnq385pQlNjtZ8xcmRh1i96QCR3Ztojm9TMB581a1kscxSrJ
	 nq8babeMmfgcvX0f6ail4xqZMujdIAlFEEK+a7+8WEsTNumg8ZzAlVrVwABK2BWX4U
	 hSQGO/aoCJPF4V8xJ6Z+vRtWgIR3e4hUHJSsY2QRjK+JrnAbPmOTV/FojO77dKBmQR
	 frCSgy5419vTSJhU0wrYvrI2eeV53fT2nvNC8gSIRwu/4AL6qr+X9EzKctBjB8Ptvy
	 i443ymSJEy8rg==
Date: Tue, 9 Jun 2026 14:00:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] RISC-V SpacemiT Devicetrees for v7.2
Message-ID: <20260609-pompous-imposing-dragon-fc18cb@quoll>
References: <20260602070257-KYC5031219@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260602070257-KYC5031219@kernel.org>

On Tue, Jun 02, 2026 at 07:10:07AM +0000, Yixun Lan wrote:
> Hi SoC Maintainers,
> 
>    Please pull SpacemiT's DeviceTree changes for v7.2
> 
> Yixun Lan
> 
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/spacemit-com/linux spacemit-dt-for-7.2-1

Please switch to kernel.org repo. Github is not really a trusted place
and you have kernel.org account, so not sure why Github is still there.

> 
> for you to fetch changes up to 793cc54475b49b5b558902b5c13e4bfe66530a50:
> 
>   riscv: dts: spacemit: enable PMIC on OrangePi R2S (2026-06-01 06:32:42 +0000)
> 
> ----------------------------------------------------------------
> RISC-V SpacemiT DT changes for 7.2

Thanks, applied

Best regards,
Krzysztof

