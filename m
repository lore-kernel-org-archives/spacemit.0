Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A02A389DEC
	for <spacemit@lists.linux.dev>; Mon, 20 Apr 2026 08:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776675055; cv=none; b=QFId9Ut0QRAbxPDesdUcgzc1GT+5WlgX6HbcDlypStt/9A8kuy+6ljNt7HO2OJijHD0ZVSDGmGf6iAoAnyX7Os03eDbplVvob1pgBb9fmG23/jF7cjxyev1Ok2XrI06PY0BdOZkB71e2kf/0KfM40QBXEoOzbC1MkRp6HBqV6U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776675055; c=relaxed/simple;
	bh=GAd03qd6y1JXb/BljJpKT+Q33i3r/XD/+y23MmZWA6k=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=Ik+5XjxIiDmlnU3Abrud46x7UZ7GyxfzIQwMUzAmLVxc5epEgswRxeWwzNUJkUMExCQG83CMJyDa4yDhJaN82DDkHbfWPgQP44YVRmPe+4hOwci1uSpSaea1SblQ+xAhF+V0C1oJqQGYeiDuvIAvF9ZDpkGXNTVaCXguOj8ZCRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=TAmXbhv3; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="TAmXbhv3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1776675040;
	bh=C4jv8AOEenPNqk8kCRU3fmuZmBCuqPIJLIR0ZnoQbxk=;
	h=Mime-Version:Date:Message-Id:From:To:Subject;
	b=TAmXbhv3blqj4y+ESIW1d73xDWJXE/CtzEXquiMH53trCRMYh/kIR/RMkEx7C2ukJ
	 zpwBLEEStjv3W+u5cLmCHPd8OERyGQlKIFUS8ISHDhKoD327A6jmMAUzeAvpUJ2b8g
	 Fd/Vs2mszDAduPTRvP53OlJ2DtTn5xWDkDZhon2s=
X-QQ-mid: zesmtpsz5t1776675034t1622a38d
X-QQ-Originating-IP: LdwsEwNEVx4F6gK4cwZWkEzkl1ZW7RzpwvQJevbqrVw=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 20 Apr 2026 16:50:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8737092241665561368
EX-QQ-RecipientCnt: 16
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Apr 2026 16:50:31 +0800
Message-Id: <DHXUQHVK4XRN.3CVZ3GH75L4L4@linux.spacemit.com>
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Sandie Cao"
 <sandie.cao@deepcomputing.io>, "Yixun Lan" <dlan@kernel.org>, "Troy
 Mitchell" <troy.mitchell@linux.spacemit.com>
Cc: "Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 <spacemit@lists.linux.dev>, <linux-riscv@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "kernel test
 robot" <lkp@intel.com>
Subject: Re: [PATCH] dts: riscv: spacemit: k3: only keep spacemit,k1-i2c
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260420083931.1427703-1-sandie.cao@deepcomputing.io>
 <dfa3f1a7-f4c6-4655-94c0-326f88db3896@kernel.org>
 <87ef529e-b591-49f5-9fc9-3099672e2f0f@kernel.org>
In-Reply-To: <87ef529e-b591-49f5-9fc9-3099672e2f0f@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NQ/JKI5VIEMimDOHL2lTPrO9R5BRhOIOv0wY64FKex8pDFf/RmiGgc5+
	EDsBiqVTU2awyQsQhg+tY5xM1QUDwKXlkqF1mKlbi9d/4gNohjWhBCzyBVcC8bUYZGaLYuK
	Who06bQFJQKiE6usY4kJrm8WfXiHp/WPFhaKIMqyJ/eJoeXfCu/7l5vbUYE4L0bOjGcnv2K
	yaFy8EVU3GcLhUmJmInau71CnlEH21AYtMte7N1zGy2csc7Ep9tUS+eylbtFmQTutuHPBwa
	wr2JWqBM0fKdE9imQ5HJNBmDsUzMO7ugwaXEaJpQwpFTZIhFWWuOsBCTWG18e9yoFuJM21S
	uywU9So2agB4sn22EMvzOfpBoY1vwmSme1D7MqJnRs8NYKbI2Lv0Qif1Earc8ds0YKWkmnw
	O6Z5eHpbA1zJG7VAfA92ZmaPzFlvuWhHysaHiaixa2/ngaQko0lAygIMrlFdhDhtU+AqWM6
	56HVGXHv4AmfllWQ9z7QYn5nBO7RcLCxnuVfbFpatfu+p9uLsYckRCkR17hMrGH6hnthlrM
	Ul6xtLCXaQ86XWACYmCT2Oaj4pQRjVXC/Te58HDvSehSjTWpzqEvsXrkRq3ULJ4mpl+5vTD
	mc08IINuKwq2Sbua9rbB3tbUtpAHwGldvVNqkZTMSqCPTcm4qJFF23wZi2hu+bgfGfbLL4G
	UtMsQ5vzY7uwuW3xX7kqlvOK1/0Ud89tY5NZiOft5t+URYhju8n9o+HkJikB254VKOTyN1O
	qOTfx3IrdPvKU5Z10kqy4Izp+Vwpt5BXasZUSp5gdktf/YXoZew0j44FXJc88kDNeL97uAY
	DhFWiLYodUOxrOijpEjIcQksiC1C7YU1kEZtX+ruR4yxFi2//WN0cD7a0aux5m+4co7fJhZ
	BIpz5UAwev4W3mk/GYJS+ovVFns/PVEXQQpbH+JNGAnyLe9hdiBwEtLvW6T0TDZHFhJjt6o
	Ia4x8ZZz7NszVlkfcqa+Xd74vc8XyArQQvJO8UCN/lFrJVdZgyQTKBg9A889kBg4lqm0vHj
	Srkn1j/qwll4btsAduUgPjr+AQWZRtgRfAj1FdfIbK9f8ajGu+gWr+gipMxz6hi8MThVKoy
	BkEvmnjiCS6
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

On Mon Apr 20, 2026 at 4:44 PM CST, Krzysztof Kozlowski wrote:
> On 20/04/2026 10:43, Krzysztof Kozlowski wrote:
>> On 20/04/2026 10:39, Sandie Cao wrote:
>>> Fix dtcheck issue: compatible:0: 'spacemit,k1-i2c' was expected
>>=20
>> Missing space after main commit msg.
>>=20
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Closes: https://lore.kernel.org/r/202604140259.eKDaxKua-lkp@intel.com/
>>>
>
> Also, the file reported in above warning DOES NOT EXIST (I checked
> next-20260414).
In Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml:

properties:
  compatible:
    enum:
      - spacemit,k1-pinctrl
      - spacemit,k3-pinctrl

So there's no reason to use k1-i2c. As far as I can tell, while they are th=
e same IP,
there are subtle differences between them.

                                  - Troy
