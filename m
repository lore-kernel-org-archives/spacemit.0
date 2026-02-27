Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E5841C2FB;
	Fri, 27 Feb 2026 15:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772205915; cv=none; b=SFhxFk6WajBtTqm1RJjs+6Vs2LmFuuC7NHaItMCV1z0Ot9iIDLDPoUUsw/mdBlCWruFQwNgueZE2UmiZmKvxcJDVQ3EFRaRBg7C2uIyvaIuOFpgOK+92mNDs5pbyTv+pQis63MfJeqBKoToq2ZUysaE3cmvVwYWeorpNM9NL+Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772205915; c=relaxed/simple;
	bh=TD6wUUXGrC/h9lopsUDiqeD+IbL4J/yZpjSRmDaPsc8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HMTJzwiZlzsRG38DBmzSl1gt5dsf74aokbcFIQGPQmzO3jhreKUOCfS7P5XRvhX9qqO/DNfDX5yQ5Q0+Bp/ZSO/blk025CXBf++WlK1ldfLKq9rXfrzJYtY4QaV4MGe241/E/5gLK9iEhLDvU4A69M9jQlCopepJiAHC8StTC9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XS7D46qK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XS7D46qK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 644C6C116C6;
	Fri, 27 Feb 2026 15:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772205914;
	bh=TD6wUUXGrC/h9lopsUDiqeD+IbL4J/yZpjSRmDaPsc8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XS7D46qKvbKowwm7Z4MQBZ1CFwH8lRjqyxUzbkG+PQt5p6a1LSj2qWyID6HFjmAu/
	 /Q1pfZQM5+lX+gOEPGDfX0u8nSAOH/DACGelVfgzT2YUzgbPlm13CN9NghCKJibsmn
	 Fet1LNLj+YKRsy2Z+OMGF9AXlRWH1AYQmFL9njP4sNyPLdgoiXRS9Bp87UXy26Uqwh
	 hgCrVRauU4kg6+FMyxyQ9nUzZxab8ou0VAF38A8eKMcertDfMXxZi4mFLhNHsE4Dwi
	 sSH0kN1jW0NUfb+U5IgFqfkwIBG3ZzGLcDGzNwKk8S9AYGHuNEg2sY/sBTSjsPWcXr
	 7Q18eN0E8IbnQ==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Ze Huang <huang.ze@linux.dev>, Yixun Lan <dlan@kernel.org>
Cc: Vladimir Oltean <olteanv@gmail.com>, 
 Junzhong Pan <panjunzhong@linux.spacemit.com>, spacemit@lists.linux.dev, 
 linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260216152653.25244-1-dlan@kernel.org>
References: <20260216152653.25244-1-dlan@kernel.org>
Subject: Re: [PATCH v3] phy: k1-usb: add disconnect function support
Message-Id: <177220591203.320398.3042297469534840289.b4-ty@kernel.org>
Date: Fri, 27 Feb 2026 20:55:12 +0530
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 16 Feb 2026 23:26:53 +0800, Yixun Lan wrote:
> A disconnect status BIT of USB2 PHY need to be cleared, otherwise
> it will fail to work properly during next connection when devices
> connect to roothub directly.
> 
> 

Applied, thanks!

[1/1] phy: k1-usb: add disconnect function support
      commit: f0cf0a882a02dcf28547f32264f6fd37e9a7b147

Best regards,
-- 
~Vinod


