Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CB52F85B
	for <spacemit@lists.linux.dev>; Sat, 27 Dec 2025 02:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.184.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766800983; cv=none; b=dPs5t2aGl6OcR21SL1aVXo/s0JoOJ5F5bjNGxodcvZNyezdhXhvghUMoVeAutvRayjRuUm46maGqqGpi5ixT3wAgUewR7LuLMGvhaF1GCMCcnUaWq/GBs6qLwbW9c3zFz1Q7otJ+6/mYhAdqqvqxUDZYhkqunZtGFVno8tRjlJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766800983; c=relaxed/simple;
	bh=5qQE/jGgTswowfQxH/R6THn/S+v/D8nvTlZVqOUq5tg=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=FXfOXRk8pyu1ES94EuoSB14Qxni2D0p9kNSaHHF649hIxjnu/NBIiuZQYk0hcK0M3ZWRV4HoHZ04aegl25SYGTNWuWE3mwCiNrmELCWTGbInmmW7QymozANc5YKqQgI3LvNhKycIBPiE2aGQjwj2aORU29j4sYE0XFlVO3Dh1Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=pF42UkQ7; arc=none smtp.client-ip=15.184.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="pF42UkQ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766800912;
	bh=p41JuVTqBNxRCHQKjtwk9ihG/E0dETrJ8qiujU9CX/Q=;
	h=Message-ID:Date:MIME-Version:To:Subject:From;
	b=pF42UkQ7UIaMmac2wQ4OC5IlW210rQM8nscuXdslVME1hNkX9OP5yZDlZwu3CCeKb
	 wEe8liH40que5BfnHpKAb4/gUkmGyYD01XaOr8BHy/c5ImK4oc3ocmEqYOFGd+JUmF
	 bgv8/ZFI1nWuVlgx85uAz7wLoUw9HjSkHzsM6+8A=
X-QQ-mid: esmtpsz10t1766800904t01fdd883
X-QQ-Originating-IP: XEmEg72aS76MD4WYEtk9iltG/a16lqIcS6dJYB0LFMQ=
Received: from [10.0.90.81] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 27 Dec 2025 10:01:42 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 992677309466334211
Message-ID: <F78A665DD30EECAD+3a96ec99-07a5-4077-946a-85cf2241cf9d@linux.spacemit.com>
Date: Sat, 27 Dec 2025 10:01:42 +0800
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: huang.ze@linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, dlan@gentoo.org,
 huangze@whut.edu.cn, kishon@kernel.org, krzk+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-riscv@lists.infradead.org, robh@kernel.org, spacemit@lists.linux.dev,
 vkoul@kernel.org
References: <20251017-k1-usb2phy-v6-0-7cf9ea2477a1@linux.dev>
Subject: Re: [PATCH v6 0/2] Add USB2.0 PHY support for SpacemiT K1
Content-Language: en-US
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
In-Reply-To: <20251017-k1-usb2phy-v6-0-7cf9ea2477a1@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: NAtipnnbTPeag2ufG0IrQBlJF3XY/Xj2fFKDUM0ICmCBHifY8wHxcGxO
	/VadelyRLAGDIStX0WtaMOeoTrc2rqZO46GFzZtWTC/RzgbkRCV6VxVKc0FkALjPV33ZftR
	wi8hH6BPCZ6LhAGGqIzsu9455mWNsxL1FCqCVxO3t8KPgxm5zt2KfO3Fo4ftEb7an2csJFr
	RkYosnK1DZj9c0xJwDsh/W46fPoCnybgJEbLfc2uiju3+kyt0C0lKWSUJ8nc58bqdRkZKri
	bAePDnO3J4u6Vas/kjSUlzqfXwawT+RgiCdHpnL/l1uNjUeZi8I3bsh1cmn2bv5kRxr3Wms
	ftvInoA4eYQGgTDC5RwasS271ggxbd3LOWtUa77qlYtqiCcl4ceyImYa2N3ZulgLHUkOk/M
	deTbGNJDX1bwQGp1diLLMuTgp/0a2KOhWo7d+Mga4ZEuKq9aUCyZ5hT1Oni6bCmnzHbJIl/
	rdQmjTznlBRPjWjyPu2QQANpgyKDVvgQgje0sPQ3KixbIgAet+ELcREZ2Tl+OsWH7fKHsEe
	VMzaoCRrUr9XhwCjWaSQ4nKIFYFTAA0wXtzARsrcxJyH8ROmf2U27WkL3YOOC21ZFvsqfGF
	25l+j07I12p7rjIMnKxYMMkuYV60A+a8wIN6vGGfo/pvxbpgKMkE07oZPknPxjKiDPNEHVD
	4DaBEs6svAdFdRCugIK2SyyfUon7xw69hcnDWu1NuDbUnA66aQ02+JoWL3p4P2Wmyg4h8q3
	NJkW0opolWcr7kN/Oey70nr7BVvgRyN7n2bk96s2ujpEyogf6Ycp7YRjhFve8glH/n2CcKn
	CDSIDX729v/MlzsF+tGrlubgo7cFdhn3v8NpQ8+fcF4+n6moRhqv4iXympDhVoau/UGAixY
	aUCDDVRp7KsQdet4ykytYQ1Qb2jmYRvN3dQaPPxwVnYq9AazDKbnq+1OWmHiH5qSWW96G4T
	zNRKX9wyefG6lsAoWk3nlOeQr/ge4FUcemoU2btQhwv5cZ6OyMYZNOMjWLO2Z+IOcV2Pdkd
	eUvjzZ5U31OX8CPTl5dPXCvc94E9E=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

On Fri, 17 Oct 2025 22:49:51 +0800, Ze Huang wrote:
> This patch series introduces support for the USB2.0 PHY on the SpacemiT
> K1 SoC. The implementation has been tested on the Milk-V Jupiter and
> BananaPi-f3.
> 
> K1 includes three USB ports as follows[1]:
> - A USB2.0 OTG Port
> - A USB2.0 Host Only Port
> - A USB3.0 Port with a USB2.0 DRD interface
> 
> Each of these ports is connected to a USB2.0 PHY responsible for USB2
> transmission.
> 
> This series is based on 6.18-rc1.
> 
> Link: https://developer.spacemit.com/documentation?token=AjHDwrW78igAAEkiHracBI9HnTb#part5 [1]
> 
> Signed-off-by: Ze Huang <huangze@whut.edu.cn>
Tested-by: Junzhong Pan <panjunzhong@linux.spacemit.com>

