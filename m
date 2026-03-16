Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A912417D9;
	Mon, 16 Mar 2026 01:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773625238; cv=none; b=co/4apPjKE4+3FrXHkW5T6Qz7Ct03RWKsjD9shXMcCiFjNBgsbgQnn05Ec0IIiXSNGgDYGLRjcUU4TiRgGPewWXzu1aj0ek26lnqdDWjVBhAObK72dHn09FzbrkFQParRhY130iuUcmBsjWVeMPzCUwlD1VhQ4KM1bE2byqf4J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773625238; c=relaxed/simple;
	bh=ZPfHl5i+yhNvz8XVnNx77cuo9bMmwo9JExTG2xmxWdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZkwrapKL9HQ1VGFEI57e30/aZTuDXjPxuv9LsVrChjq3QVT2QaMthAfEwTlHXQNuMU+9mCfmaVjrZ7vmZVjDfr8J593bc5P9vsRIWFObW3uw7RZR7SpfHe7XOmSryqUZdQ/WvCtj0W4vXojVu6ufDJZVR8ThTKHeiT7ZAl9s5tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OAu/F4aH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OAu/F4aH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D52A9C4CEF7;
	Mon, 16 Mar 2026 01:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773625238;
	bh=ZPfHl5i+yhNvz8XVnNx77cuo9bMmwo9JExTG2xmxWdA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OAu/F4aHmlmWHQxcnlZTuAnwdugHO0Ad0CNlSoMfqzipOIzDkfbfz6No9JTQ3wq+I
	 WtSDhQG0aX1jP7qhrlsvHPPwtkz4pk2tbXaejPimF/C/WwNTAkDJN0RPD2Z4zDwwgE
	 AiHJgFhIUMA9Quo1Rw2gQjOO/931x6C6ndUXrbQygtrwKNP31ptJ6W5ndfw8ZWAiTv
	 nyGcq9NPxaQRfCHD/JyPykq+8s6ie/eQSmeZypYBCEYwlG5GzqpuoaoKgTXJkWw/37
	 ZMjBEMEIdkVFvN4hfFJaiSZsfSuNM1+zQS09T5w6tWE9FA1K47QxlxiYL8WLVTnAvh
	 X8p+V2Attkgew==
Date: Mon, 16 Mar 2026 09:40:36 +0800
From: Yixun Lan <dlan@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Junzhong Pan <junzhong.pan@spacemit.com>,
	Guodong Xu <guodong@riscstar.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] reset: spacemit: k3: Decouple composite reset lines
Message-ID: <20260316014036-GKC415778@kernel.org>
References: <20260314-01-k3-reset-usb-pci-v2-1-9dc0976d524e@kernel.org>
 <20260315-crystal-ambrosial-hamster-4b970c@quoll>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260315-crystal-ambrosial-hamster-4b970c@quoll>

Hi Krzysztof, 

On 09:53 Sun 15 Mar     , Krzysztof Kozlowski wrote:
> On Sat, Mar 14, 2026 at 08:27:25AM +0000, Yixun Lan wrote:
> > Instead of grouping several different reset lines into one composite
> > reset, decouple them to individual ones which make it more aligned
> > with underlying hardware. And for DWC USB driver, it will match well
> > with the number of the reset property in the DT bindings.
> > 
> > The DWC3 USB host controller in K3 SoC has three reset lines - AHB, VCC,
> > PHY. The PCIe controller also has three reset lines - DBI, Slave, Master.
> > Also three reset lines each for UCIE and RCPU block.
> > 
> > As an agreement with maintainer, the reset IDs has been rearranged as
> > contiguous number and pushed as a fix for the driver, and reason is that
> > there isn't any consumer of reset driver so far, so should not cause
> > any ABI breakage. Also, the changes of DT binding header file and reset
> > driver are merged together as one single commit to avoid git-bisect
> > breakage.
> > 
> > Fixes: 938ce3b16582 ("reset: spacemit: Add SpacemiT K3 reset driver)
> 
> Please run scripts/checkpatch.pl on the patches and fix reported
> warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> patches and (probably) fix more warnings. Some warnings can be ignored,
> especially from --strict run, but the code here looks like it needs a
> fix. Feel free to get in touch if the warning is not clear.
I usually run "b4 prep --check" to do the check, but I do forget it this
time, sorry about this.. will be more cautious next time

With the check, the only problem I see is one double quotes missing 
at end of the line, for the code I didn't see any complaint, let me
know if I overlooked anything?

-- 
Yixun Lan (dlan)
