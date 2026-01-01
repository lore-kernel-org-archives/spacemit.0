Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909BC4CB5B;
	Thu,  1 Jan 2026 11:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767265683; cv=none; b=dnaWvjpTfj2egI4EiLe2xgB8mV++TtFM8w+h1qbBMb2x51IoY0f6QC/5VbD8VR2/wURNeOXCtoc2606JsJNiVUaiTgNlDvvLo8eUG/qJjlzPppRr5Youv0fBrIEMK4I/Oj/EpAriuFQXR5JiN9l6xKoZXXz/17+YNZK03t8vrlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767265683; c=relaxed/simple;
	bh=gp6INFoQIq+43goOk9oT04JrR78Bq4E+oz5E4M6bfiQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bkaJ060nOiVJTWHoIt6eFwPg5354Y01ps7D1OvlXBKcz2J6zxs15sAZmKw3uRbx6QYraP7Ayc7ugfmHn0ttPkk5LcfiS4UJCXSjvWfPwiQRw3+DH0nbWnfx7VabIFyoQvH8VFOLlmsPv2KzK8aslFslz1zph886OSzDIlamZ7SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GGV10kGk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GGV10kGk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6753C116B1;
	Thu,  1 Jan 2026 11:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767265683;
	bh=gp6INFoQIq+43goOk9oT04JrR78Bq4E+oz5E4M6bfiQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GGV10kGkKqFcf14C5Upi5Cp3QL/wbrh4VI6T8Ueqa6PsJRMWmcOtw0fRl+PBA7lQl
	 BaboTeuIvtUjkRezkQ47SQ9aiR4YAahqom6C10TrcKt+X814EW5/XXRwXgd04ieomC
	 CQcATpRqCutGzxFZHRjYe7ajSsHAXZn6A+om9sG0wk9KwIZHHwCUC8xHELH8LMbVIU
	 fnWO1q+vhQ/Qs7vWBarnf/y0K2C0FzeQ9BU2vBNQxAfz+asfP43imMamyOAwKFSyju
	 YoorE+vOfapEuKDhn+ewxYbHpTr/8udBzhnrxj+1prGOhpe+SaUNTmwK69OqamWE60
	 YStqjnX/KzbKQ==
From: Vinod Koul <vkoul@kernel.org>
To: neil.armstrong@linaro.org, Alex Elder <elder@riscstar.com>
Cc: dlan@gentoo.org, pjw@kernel.org, palmer@dabbelt.com, 
 aou@eecs.berkeley.edu, alex@ghiti.fr, guodong@riscstar.com, 
 linux-phy@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>
In-Reply-To: <20251226173228.2020411-1-elder@riscstar.com>
References: <20251226173228.2020411-1-elder@riscstar.com>
Subject: Re: [PATCH] phy: Kconfig: spacemit: add COMMON_CLK dependency
Message-Id: <176726567931.201416.8144273654305302884.b4-ty@kernel.org>
Date: Thu, 01 Jan 2026 16:37:59 +0530
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 26 Dec 2025 11:32:27 -0600, Alex Elder wrote:
> The SpacemiT PCIe PHY driver depends on the common clock framework.
> Not specifying that led to a failure when doing a COMPILE_TEST build
> for the SPARC architecture.
> 
> 

Applied, thanks!

[1/1] phy: Kconfig: spacemit: add COMMON_CLK dependency
      commit: 8df20813eb01fe29b4507fd470d73675bda3e1dd

Best regards,
-- 
~Vinod


